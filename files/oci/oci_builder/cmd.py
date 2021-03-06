# Copyright (c) 2019 Codethink Ltd.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import sys
import collections
import os
from datetime import datetime
import yaml
from .image_builder import build_images


GlobalConf = collections.namedtuple('GlobalConf',
                                    ['mode', 'gzip', 'output', 'created'])


def main():
    data = yaml.load(sys.stdin, Loader=yaml.CLoader)
    mode = data.get('mode', 'oci')
    enabled_gzip = data.get('gzip', mode == 'oci')
    created = data.get('created',
                       datetime.utcnow().strftime("%Y-%m-%dT%H:%M:%SZ")
    )

    global_conf = GlobalConf(mode, enabled_gzip, os.getcwd(), created)
    build_images(global_conf, data.get('images', []), data.get('annotations'))
