from ._downloadablefilesource import DownloadableFileSource
from buildstream import utils
from urllib.parse import urlparse
import os.path

class FileSource(DownloadableFileSource):
    def stage(self, directory):
        url = urlparse(self.url)
        utils.safe_link(self._get_mirror_file(),
                        os.path.join(directory, os.path.basename(url.path)))

def setup():
    return FileSource
