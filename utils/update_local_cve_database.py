"""Downloads CVE database and store it as sqlite3 database.

This tool does not take parameter. It will create files in the current
directory:
 - data.db: The sqlite3 database itself.
 - nvdcve-2.0-*.xml.gz: The cached raw XML databases from the CVE database.

Do not remove nvdcve-2.0-*.xml.gz files unless you remove
data.db. data.db contains etags, and files would not be downloaded
again if files are just removed.

Files are not downloaded if not modified. But we still verify with the
remote database we have the latest version of the files.
"""

import gzip
import sqlite3
import datetime
import urllib.request
import urllib.parse
from contextlib import contextmanager, ExitStack
import signal
import socket
import json

def extract_vulns(tree):
    for item in tree['CVE_Items']:
        cve_id = item['cve']['CVE_data_meta']['ID']
        summary = item['cve']['description']['description_data'][0]['value']
        score = item['impact'].get('baseMetricV2', {}).get('cvssV2', {}).get('baseScore')
        yield cve_id, summary, score


def extract_product_vulns_sub(cve_id, node):
    if "cpe_match" in node:
        for vuln_software in node["cpe_match"]:
            if vuln_software["vulnerable"]:
                product_name = vuln_software["cpe23Uri"]
                try:
                    vendor, name, version = product_name.split(':')[3:6]
                except ValueError:
                    continue
                yield cve_id, vendor, name, version
    else:
        for child in node.get("children", []):
            yield from extract_product_vulns_sub(cve_id, child)

def extract_product_vulns(tree):
    for item in tree['CVE_Items']:
        cve_id = item['cve']['CVE_data_meta']['ID']
        for node in item['configurations']["nodes"]:
            yield from extract_product_vulns_sub(cve_id, node)

def ensure_tables(c):
    c.execute("""CREATE TABLE IF NOT EXISTS etags
                 (year TEXT UNIQUE, etag TEXT)""")
    c.execute("""CREATE TABLE IF NOT EXISTS cve
                 (id TEXT UNIQUE, summary TEXT, score TEXT)""")
    c.execute("""CREATE TABLE IF NOT EXISTS product_vuln
                 (cve_id TEXT, name TEXT, vendor TEXT, version TEXT,
                  UNIQUE(cve_id, name, vendor, version))""")


class UrlOpenTimeout:

    def __init__(self):
        self._max = 120
        self._min = 5
        self._timeout = self._max

    @contextmanager
    def open(self, req):
        with ExitStack() as stack:
            def _timeout(signum, frame):
                raise TimeoutError()
            try:
                signal.signal(signal.SIGALRM, _timeout)
                signal.alarm(self._timeout)
                resp = stack.enter_context(urllib.request.urlopen(req, timeout=self._timeout))
                self._timeout = self._max
            except TimeoutError:
                self._timeout = max(int(self._timeout/2), self._min)
                raise
            except urllib.error.URLError as exception:
                if isinstance(exception.reason, socket.timeout):
                    self._timeout = max(int(self._timeout/2), self._min)
                    raise TimeoutError()
                raise
            finally:
                signal.alarm(0)

            yield resp

def update_year(cursor, updated_year, url_timeout):
    url = 'https://nvd.nist.gov/feeds/json/cve/1.1/nvdcve-1.1-{}.json.gz'.format(updated_year)
    cursor.execute("SELECT etag FROM etags WHERE year=?", (updated_year,))
    row = cursor.fetchone()
    if row is not None:
        etag = row[0]
    else:
        etag = None

    request = urllib.request.Request(url)
    if etag is not None:
        request.add_header('If-None-Match', etag)
        url_opener = url_timeout.open
    else:
        url_opener = urllib.request.urlopen
    try:
        with url_opener(request) as resp:
            new_etag = resp.getheader('ETag')
            assert new_etag is not None
            if new_etag is not None:
                cursor.execute("INSERT OR REPLACE INTO etags (year, etag) VALUES (?, ?)", (year, new_etag))
            with open('nvdcve-1.1-{}.json.gz'.format(year), 'wb') as file:
                while True:
                    buf = resp.read(4096)
                    if not buf:
                        print("Downloaded {}".format(file.name))
                        break
                    file.write(buf)
    except TimeoutError:
        if etag is None:
            raise
        print("Timeout, using cache for {}".format('nvdcve-1.1-{}.json.gz'.format(year)))
    except urllib.error.HTTPError as error:
        if error.code == 304:
            print("Cached {}".format('nvdcve-1.1-{}.json.gz'.format(year)))
        elif error.code == 404:
            print("{} not found".format('nvdcve-1.1-{}.json.gz'.format(year)))
            return
        else:
            raise

    with gzip.open('nvdcve-1.1-{}.json.gz'.format(year)) as file:
        tree = json.load(file)
        for cve_id, summary, score in extract_vulns(tree):
            cursor.execute("INSERT OR REPLACE INTO cve (id, summary, score) VALUES (?, ?, ?)", (cve_id, summary, score))

        for cve_id, vendor, name, version in extract_product_vulns(tree):
            cursor.execute("INSERT OR REPLACE INTO product_vuln (cve_id, name, vendor, version) VALUES (?, ?, ?, ?)", (cve_id, name, vendor, version))

if __name__ == '__main__':
    # TODO do other connections need closing
    connection = sqlite3.connect('data-2.db')
    cursor = connection.cursor()
    try:
        ensure_tables(cursor)
        url_timeout = UrlOpenTimeout()
        for year in range(2002, datetime.datetime.now().year + 1):
            update_year(cursor, str(year), url_timeout)
        update_year(cursor, 'Modified', url_timeout)
        connection.commit()
    finally:
        connection.close()
