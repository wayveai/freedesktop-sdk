import os
import re
import shutil
import tarfile
import zipfile
import stat
import contextlib
import urllib.request
import urllib.parse
import json
from datetime import datetime
from buildstream import Source, SourceError, utils, Consistency

def strip_top_dir(members, attr):
    for member in members:
        path = getattr(member, attr)
        trail_slash = path.endswith('/')
        path = path.rstrip('/')
        splitted = getattr(member, attr).split('/', 1)
        if len(splitted) == 2:
            new_path = splitted[1]
            if trail_slash:
                new_path += '/'
            setattr(member, attr, new_path)
            yield member

def make_key(item):
    for download in item[1]:
        if download['packagetype'] == 'sdist':
            try:
                date = datetime.strptime(download['upload_time_iso_8601'],
                                         '%Y-%m-%dT%H:%M:%S.%fZ')
            except ValueError:
                date = datetime.strptime(download['upload_time_iso_8601'],
                                             '%Y-%m-%dT%H:%M:%SZ')
            return date
    return datetime.fromtimestamp(0)

class PyPISource(Source):
    REST_API = "https://pypi.org/pypi/{name}/json"
    STORAGE_ROOT = "https://files.pythonhosted.org/packages/"
    KEYS = [
        "url",
        "name",
        "ref",
        "include",
        "exclude",
    ] + Source.COMMON_CONFIG_KEYS

    def configure(self, node):
        self.node_validate(node, self.KEYS)

        self.name = self.node_get_member(node, str, 'name')

        self.include = self.node_get_member(node, list, 'include', [])
        self.exclude = self.node_get_member(node, list, 'exclude', [])

        self.original_base_url = self.node_get_member(
            node, str, "url", self.STORAGE_ROOT
        )

        self.base_url = self.translate_url(self.original_base_url)
        self.load_ref(node)

    @property
    def url(self):
        return urllib.parse.urljoin(
            self.base_url,
            self.ref["suffix"],
        )

    @property
    def original_url(self):
        if self.base_url == self.original_base_url:
            url = self.url
        else:
            url = self.original_base_url + self.ref["suffix"]
        return url

    def preflight(self):
        pass

    def get_unique_key(self):
        return [
            self.ref["suffix"],
            self.ref["sha256sum"]
        ]

    def load_ref(self, node):
        self.ref = self.node_get_member(node, dict, "ref", None)

    def get_ref(self):
        return {
            "sha256sum": self.ref["sha256sum"],
            "suffix": self.ref["suffix"],
        }

    def set_ref(self, ref, node):
        node["ref"] = self.ref = ref

    def track(self):
        payload = json.loads(
            urllib.request.urlopen(self.REST_API.format(name=self.name)).read()
        )
        releases = payload['releases']
        if not releases:
            raise SourceError(f'{self}: Cannot find any tracking for {self.name}')
        selected_release = None
        if self.include or self.exclude:
            includes = list(map(re.compile, self.include))
            excludes = list(map(re.compile, self.exclude))
            urls = self._calculate_latest(releases,
                                          includes,
                                          excludes
                                          )
        else:
            urls = releases[payload['info']['version']]
        found_ref = None
        for url in urls:
            if url['packagetype'] == 'sdist':
                found_ref = {
                    'sha256sum': url['digests']['sha256'],
                    'suffix': url['url'].replace(self.STORAGE_ROOT, ""),
                }
                break

        if found_ref is None:
            raise SourceError(f'{self}: Did not find any sdist for {self.name} {selected_release}')

        return found_ref

    def _calculate_latest(self, releases, includes, excludes):
        for release, urls in sorted(releases.items(), key=make_key, reverse=True):
            if excludes:
                excluded = False
                for exclude in excludes:
                    if exclude.match(release):
                        excluded = True
                        break
                if excluded:
                    continue
            if includes:
                for include in includes:
                    if include.match(release):
                        return urls
            else:
                return urls

        raise SourceError(f'{self}: No matching release')

    def _get_mirror_dir(self):
        return os.path.join(self.get_mirror_directory(),
                            utils.url_directory_name(self.name))

    def _get_mirror_file(self, sha=None):
        if not sha:
            sha = self.ref["sha256sum"]
        return os.path.join(self._get_mirror_dir(), sha)

    def fetch(self):
        # More or less copied from _downloadablefilesource.py
        try:
            with self.tempdir() as tempdir:
                default_name = os.path.basename(self.url)
                request = urllib.request.Request(self.url)
                request.add_header('Accept', '*/*')
                request.add_header('User-Agent', 'BuildStream/1')

                with contextlib.closing(urllib.request.urlopen(request)) as response:
                    info = response.info()
                    filename = info.get_filename(default_name)
                    filename = os.path.basename(filename)
                    local_file = os.path.join(tempdir, filename)
                    with open(local_file, 'wb') as dest:
                        shutil.copyfileobj(response, dest)

                if not os.path.isdir(self._get_mirror_dir()):
                    os.makedirs(self._get_mirror_dir())

                sha256 = self.ref["sha256sum"]
                computed = utils.sha256sum(local_file)
                if sha256 != computed:
                    raise SourceError(f"{self.url} expected hash {sha256}, got {computed}")
                os.rename(local_file, self._get_mirror_file(sha256))
                return sha256

        except (urllib.error.URLError, urllib.error.ContentTooShortError, OSError) as e:
            raise SourceError(f"{self}: Error mirroring {self.url}: {e}",
                              temporary=True) from e

    def stage(self, directory):
        if not os.path.exists(self._get_mirror_file()):
            raise SourceError(f"{self}: Cannot find mirror file {self._get_mirror_file()}")
        if self.ref["suffix"].endswith('.zip'):
            with zipfile.ZipFile(self._get_mirror_file(), mode='r') as zipf:
                exec_rights = (stat.S_IRWXU | stat.S_IRWXG | stat.S_IRWXO) & ~(stat.S_IWGRP | stat.S_IWOTH)
                noexec_rights = exec_rights & ~(stat.S_IXUSR | stat.S_IXGRP | stat.S_IXOTH)
                # Taken from zip plugin. It is needed to ensure reproducibility of permissions
                for member in strip_top_dir(zipf.infolist(), 'filename'):
                    written = zipf.extract(member, path=directory)
                    rel = os.path.relpath(written, start=directory)
                    assert not os.path.isabs(rel)
                    rel = os.path.dirname(rel)
                    while rel:
                        os.chmod(os.path.join(directory, rel), exec_rights)
                        rel = os.path.dirname(rel)

                    if os.path.islink(written):
                        pass
                    elif os.path.isdir(written):
                        os.chmod(written, exec_rights)
                    else:
                        os.chmod(written, noexec_rights)
        else:
            with tarfile.open(self._get_mirror_file(), 'r:gz') as tar:
                tar.extractall(path=directory, members=strip_top_dir(tar.getmembers(), 'path'))

    def get_consistency(self):
        if self.ref is None:
            return Consistency.INCONSISTENT
        for mandatory in ("suffix", "sha256sum"):
            if mandatory not in self.ref:
                return Consistency.INCONSISTENT
        if os.path.isfile(self._get_mirror_file()):
            return Consistency.CACHED
        return Consistency.RESOLVED

def setup():
    return PyPISource
