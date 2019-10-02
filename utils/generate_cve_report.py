"""Generate and HTML output with all current CVEs for a given manifest.

Usage:
  python3 generate-cve-report.py path/to/manifest.json output.html

This requires you to run update_local_cve_database.py first in the
same current directory.
"""

import json
import sys
import sqlite3
import os
import urllib.request
import urllib.error

connection = sqlite3.connect('data-2.db')
cursor = connection.cursor()

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

with open(sys.argv[1], 'rb') as f:
    manifest = json.load(f)

with open(sys.argv[2], 'w') as out:
    out.write('<!DOCTYPE html>\n')
    out.write('<html><head><title>Report</title></head><body><table>\n')

    entries = []
    for module in manifest["modules"]:
        name = module["name"]
        sources = module["sources"]
        cpe = module["x-cpe"]
        product = cpe["product"]
        version = cpe.get("version")
        vendor = cpe.get("vendor")
        patches = cpe.get("patches", [])
        ignored = cpe.get("ignored", [])
        if not version:
            print("{} is missing a version".format(name))
            continue

        if vendor:
            cursor.execute("""SELECT cve.id, cve.summary, cve.score FROM cve, product_vuln
                             WHERE cve.id=product_vuln.cve_id
                               AND product_vuln.name=?
                               AND product_vuln.version=?
                               AND product_vuln.vendor=?""",
                           (product, version, vendor))
        else:
            cursor.execute("""SELECT cve.id, cve.summary, cve.score FROM cve, product_vuln
                             WHERE cve.id=product_vuln.cve_id
                               AND product_vuln.name=?
                               AND product_vuln.version=?""",
                           (product, version))
        while True:
            row = cursor.fetchone()
            if row is None:
                break
            if row[0] in patches or row[0] in ignored:
                continue
            entries.append((row[0], name, version, row[1], row[2]))

    def by_score(entry, ): # TODO why the empty 2nd args?
        entry_score = entry[4]
        try:
            return float(entry_score)
        except ValueError:
            return float("inf")

    for ID, name, version, summary, score in sorted(entries, key=by_score, reverse=True):
        out.write('<tr>')
        out.write('<td><a href="https://nvd.nist.gov/vuln/detail/{ID}">{ID}</a></td>'.format(ID=ID))
        for d in [name, version, summary, score]:
            out.write('<td>{}</td>'.format(d))
        out.write('<td>')
        found_entry = False
        for entry_id, link in get_issues_and_mrs(ID):
            out.write(f'<a href="{link}">{entry_id}</a> ')
            found_entry = True
        if not found_entry:
            out.write('<span style="color: red">None</span>')
        out.write('</td>')
        out.write('</tr>\n')

    out.write('</table></html>\n')
