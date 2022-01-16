import os
from buildstream import Source, utils, Consistency


class PatchQueueSource(Source):

    def configure(self, node):
        self.node_validate(node, Source.COMMON_CONFIG_KEYS + ['path', 'strip'])
        self.path = self.node_get_project_path(node, 'path',
                                               check_is_dir=True)
        self.fullpath = os.path.join(self.get_project_directory(), self.path)

    def preflight(self):
        self.host_git = utils.get_host_tool("git")

    def __get_patches(self):
        for p in sorted(os.listdir(self.fullpath)):
            yield os.path.join(self.fullpath, p)

    def get_unique_key(self):
        return [utils.sha256sum(p) for p in self.__get_patches()]

    def get_consistency(self):
        return Consistency.CACHED

    def load_ref(self, node):
        pass

    def get_ref(self):
        return None

    def set_ref(self, ref, node):
        pass

    def fetch(self):
        pass

    def stage(self, directory):
        with self.timed_activity("Applying patch queue: {}".format(self.path)):
            command = [self.host_git, '-C', directory, 'apply']
            command.extend(self.__get_patches())
            self.call(command,
                      fail="Failed to apply patches from {}".format(self.path))


def setup():
    return PatchQueueSource
