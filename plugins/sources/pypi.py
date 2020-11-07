import os
import re
import shutil
import tarfile
import zipfile
import stat
import contextlib
import urllib.request
import json
from distutils.version import LooseVersion
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

class PyPISource(Source):
    def configure(self, node):
        self.node_validate(node, ['url', 'name', 'sha256sum',
                                  'include', 'exclude', 'index',
                                  'scheme'] +
                           Source.COMMON_CONFIG_KEYS)

        self.load_ref(node)
        self.name = self.node_get_member(node, str, 'name', None)
        if self.name is None:
            raise SourceError(f'{self}: Missing name')
        self.include = self.node_get_member(node, list, 'include', [])
        self.exclude = self.node_get_member(node, list, 'exclude', [])
        self.index = self.node_get_member(node, str, 'index', 'https://pypi.org/pypi')
        self.scheme = self.node_get_member(node, str, 'scheme', None)

    def preflight(self):
        pass

    def get_unique_key(self):
        return [self.url, self.sha256sum]

    def load_ref(self, node):
        self.sha256sum = self.node_get_member(node, str, 'sha256sum', None)
        self.url = self.node_get_member(node, str, 'url', None)
        if self.url is not None:
            self.translated_url = self.translate_url(self.url)
        else:
            self.translated_url = None

    def get_ref(self):
        if self.url is None or self.sha256sum is None:
            return None
        return {'url': self.url,
                'sha256sum': self.sha256sum}

    def set_ref(self, ref, node):
        node['url'] = self.url = ref['url']
        node['sha256sum'] = self.sha256sum = ref['sha256sum']


    def track(self):
        payload = json.loads(
            urllib.request.urlopen(f'{self.index}/{self.name}/json').read()
        )
        releases = payload['releases']
        if not releases:
            raise SourceError(f'{self}: Cannot find any tracking for {self.name}')
        selected_release = None
        if self.include or self.exclude:
            includes = list(map(re.compile, self.include))
            excludes = list(map(re.compile, self.exclude))
            selected_release = self._calculate_latest(releases,
                                                      includes,
                                                      excludes
                                                      )
        else:
            selected_release = payload['info']['version']
        urls = releases[selected_release]
        found_ref = None
        for url in urls:
            if url['packagetype'] == 'sdist':
                built_url = url['url']
                if self.scheme is not None:
                    built_url = built_url.replace(
                        'https://', f'{self.scheme}:'
                    )
                found_ref = {
                    'sha256sum': url['digests']['sha256'],
                    'url': built_url,
                }
                break

        if found_ref is None:
            raise SourceError(f'{self}: Did not find any sdist for {self.name} {selected_release}')

        return found_ref

    def _calculate_latest(self, releases, includes, excludes):
        for release in sorted(releases, key=LooseVersion, reverse=True):
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
                        return release
            else:
                return release

        raise SourceError(f'{self}: No matching release')

    def _get_mirror_dir(self):
        return os.path.join(self.get_mirror_directory(),
                            utils.url_directory_name(self.name))

    def _get_mirror_file(self, sha=None):
        return os.path.join(self._get_mirror_dir(), sha or self.sha256sum)

    def fetch(self):
        # More or less copied from _downloadablefilesource.py
        try:
            with self.tempdir() as tempdir:
                default_name = os.path.basename(self.translated_url)
                request = urllib.request.Request(self.translated_url)
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

                sha256 = utils.sha256sum(local_file)
                os.rename(local_file, self._get_mirror_file(sha256))
                return sha256

        except (urllib.error.URLError, urllib.error.ContentTooShortError, OSError) as e:
            raise SourceError(f"{self}: Error mirroring {self.translated_url}: {e}",
                              temporary=True) from e

    def stage(self, directory):
        if not os.path.exists(self._get_mirror_file()):
            raise SourceError(f"{self}: Cannot find mirror file {self._get_mirror_file()}")
        if self.translated_url.endswith('.zip'):
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
        if self.url is None or self.sha256sum is None:
            return Consistency.INCONSISTENT

        if os.path.isfile(self._get_mirror_file()):
            return Consistency.CACHED
        return Consistency.RESOLVED

def setup():
    return PyPISource
