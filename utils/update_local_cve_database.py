"""
Downloads CVE database


Usage:
  python3 update_local_cve_database.py

This tool will create files in the current
directory:
 - nvdcve-2.0-*.xml.gz: The cached raw XML databases from the CVE database.
 - nvdcve-2.0-*.xml.gz.etag: Related etags for downloaded files
"""

import datetime
import os.path

import requests
from requests.adapters import HTTPAdapter
from urllib3.util.retry import Retry

TIMEOUT = (10, 30)


def update_year(session, updated_year):
    url = 'https://nvd.nist.gov/feeds/json/cve/1.1/nvdcve-1.1-{}.json.gz'.format(updated_year)
    headers = {}
    filename = 'nvdcve-1.1-{}.json.gz'.format(year)
    if os.path.exists(filename):
        try:
            with open(f"{filename}.etag") as file:
                etag = file.read()
        except FileNotFoundError:
            etag = None
        else:
            headers["If-None-Match"] = etag
    else:
        etag = None

    response = session.get(url, headers=headers, stream=True,
                           timeout=TIMEOUT)
    if not response.ok:
        if response.status_code == 404:
            print("{} not found".format('nvdcve-1.1-{}.json.gz'.format(year)))
            for _ in response.iter_content():
                pass
    elif response.status_code == 304:
        response.close()
        print("Cached {}".format('nvdcve-1.1-{}.json.gz'.format(year)))
    else:
        etag = response.headers["ETag"]
        assert etag is not None
        with open(filename, 'wb') as file:
            for chunk in response.iter_content(1024**2):
                file.write(chunk)
            print("Downloaded {}".format(file.name))
            with open(f"{filename}.etag", "w") as file:
                file.write(etag)

if __name__ == "__main__":
    entries = []
    with requests.session() as session:
        retries = Retry(total=5, backoff_factor=1)
        session.mount('https://', HTTPAdapter(max_retries=retries))
        for year in range(2002, datetime.datetime.now().year + 1):
            update_year(session, str(year))
