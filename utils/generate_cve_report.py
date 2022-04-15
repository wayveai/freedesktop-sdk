"""
Downloads CVE database and generate HTML output with all current CVEs for a given manifest.

Usage:
  python3 generate-cve-report.py path/to/manifest.json output.html

This tool will create files in the current
directory:
 - nvdcve-2.0-*.xml.gz: The cached raw XML databases from the CVE database.
 - nvdcve-2.0-*.xml.gz.etag: Related etags for downloaded files

Files are not downloaded if not modified. But we still verify with the
remote database we have the latest version of the files.
"""

import json
import sys
import gzip
import glob
import os
import urllib.request
import urllib.error

import packaging.version


LOOKUP_TABLE = {}

with open(sys.argv[1], 'rb') as f:
    manifest = json.load(f)
    for module in manifest["modules"]:
        cpe = module["x-cpe"]
        version = cpe.get("version")
        if not version:
            continue
        vendor = cpe.get("vendor")
        vendor_dict = LOOKUP_TABLE.setdefault(cpe.get("vendor"), {})
        vendor_dict[cpe["product"]] = {
            "name": module["name"],
            "version": version,
            "patches": cpe.get("patches", []),
            "ignored": cpe.get("ignored", [])
        }


def extract_product_vulns_sub(node):
    if "cpe_match" in node:
        for cpe_match in node["cpe_match"]:
            if cpe_match["vulnerable"]:
                yield cpe_match
    else:
        for child in node.get("children", []):
            yield from extract_product_vulns_sub(child)


def extract_product_vulns(tree):
    for item in tree['CVE_Items']:
        summary = item['cve']['description']['description_data'][0]['value']
        score = item['impact'].get('baseMetricV2', {}).get('cvssV2', {}).get('baseScore')
        cve_id = item['cve']['CVE_data_meta']['ID']
        for node in item['configurations']["nodes"]:
            for cpe_match in extract_product_vulns_sub(node):
                yield cve_id, summary, score, cpe_match

api = os.environ.get("CI_API_V4_URL")
project_id = os.environ.get("CI_PROJECT_ID")

def get_entries(entry_char, entry_type, cveid):
    req = urllib.request.Request(f'{api}/projects/{project_id}/{entry_type}?search={cveid}')
    try:
        resp = urllib.request.urlopen(req)
        entries = json.load(resp)
        for entry in entries:
            iid = entry.get('iid')
            yield f'{entry_char}{iid}', entry.get('web_url')
    except urllib.error.HTTPError:
        pass

def get_issues_and_mrs(cveid):
    if not api or not project_id:
        return
    for entry_name, url in get_entries('!', 'merge_requests', cveid):
        yield entry_name, url
    for entry_name, url in get_entries('#', 'issues', cveid):
        yield entry_name, url


def extract_vulnerabilities(filename):
    print(f"Processing {filename}")
    with gzip.open(filename) as file:
        tree = json.load(file)
        for cve_id, summary, score, cpe_match in extract_product_vulns(tree):
            product_name = cpe_match["cpe23Uri"]
            vendor, name, version = product_name.split(':')[3:6]

            module = LOOKUP_TABLE.get(vendor, {}).get(name)
            if not module:
                module = LOOKUP_TABLE.get(None, {}).get(name)
            if not module:
                continue

            if cve_id in module["patches"] or cve_id in module["ignored"]:
                vulnerable = False
            elif module["version"] == version:
                vulnerable = True
            elif version == "*":
                version_object = packaging.version.LegacyVersion(module["version"])
                vulnerable = True
                if "versionStartIncluding" in cpe_match:
                    start = packaging.version.LegacyVersion(cpe_match["versionStartIncluding"])
                    if version_object < start:
                        vulnerable = False
                elif "versionStartExcluding" in cpe_match:
                    start = packaging.version.LegacyVersion(cpe_match["versionStartExcluding"])
                    if version_object <= start:
                        vulnerable = False
                if "versionEndIncluding" in cpe_match:
                    end = packaging.version.LegacyVersion(cpe_match["versionEndIncluding"])
                    if version_object > end:
                        vulnerable = False
                elif "versionEndExcluding" in cpe_match:
                    end = packaging.version.LegacyVersion(cpe_match["versionEndExcluding"])
                    if version_object >= end:
                        vulnerable = False
            else:
                vulnerable = False

            yield cve_id, module["name"], module["version"], summary, score, vulnerable



def by_score(entry, ): # TODO why the empty 2nd args?
    entry_score = entry[4]
    try:
        return float(entry_score)
    except ValueError:
        return float("inf")


if __name__ == "__main__":
    vuln_map = {}
    for filename in sorted(glob.glob("nvdcve-1.1-*.json.gz")):
        for cve_id, name, version, summary, score, vulnerable in extract_vulnerabilities(filename):
            if not vulnerable:
                try:
                    del vuln_map[cve_id]
                except KeyError:
                    pass
            else:
                vuln_map[cve_id] = cve_id, name, version, summary, score

    entries = list(vuln_map.values())

    entries.sort(key=by_score, reverse=True)

    with open(sys.argv[2], 'w') as out:
        out.write("|Vulnerability|Element|Version|Summary|Score|WIP|\n")
        out.write("|---|---|---|---|---|---|\n")

        for ID, name, version, summary, score in entries:
            issues_mrs = ", ".join(f"[{id}]({link})" for id, link in get_issues_and_mrs(ID)) or "None"
            out.write(f"|[{ID}](https://nvd.nist.gov/vuln/detail/{ID})|{name}|{version}|{summary}|{score}|{issues_mrs}|\n")

        out.write('<!-- Markdeep: -->'
                  '<style class="fallback">body{visibility:hidden;white-space:pre;font-family:monospace}</style>'
                  '<script src="markdeep.min.js" charset="utf-8"></script>'
                  '<script src="https://morgan3d.github.io/markdeep/latest/markdeep.min.js" charset="utf-8"></script>'
                  '<script>window.alreadyProcessedMarkdeep||(document.body.style.visibility="visible")</script>')
