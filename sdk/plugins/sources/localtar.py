import os
import tarfile

from buildstream import Source, SourceError, Consistency
from buildstream import utils


class LocalTarSource(Source):

    def configure(self, node):
        project_directory = self.get_project_directory()

        self.node_validate(node, ['path'] + Source.COMMON_CONFIG_KEYS)
        self.path = self.node_get_member(node, str, 'path')
        self.fullpath = os.path.join(project_directory, self.path)

    def preflight(self):
        if not os.path.exists(self.fullpath):
            raise SourceError("Specified path '%s' does not exist" % self.path)

    def get_unique_key(self):
        return utils.sha256sum(self.fullpath)

    def get_consistency(self):
        return Consistency.CACHED

    def get_ref(self):
        return None

    def set_ref(self, ref, node):
        pass

    def fetch(self):
        pass

    def stage(self, directory):
        try:
            with tarfile.open(self.fullpath) as tar:
                tar.extractall(path=directory)

        except (tarfile.TarError, OSError) as e:
            raise SourceError("{}: Error staging source: {}".format(self, e)) from e

def setup():
    return LocalTarSource
