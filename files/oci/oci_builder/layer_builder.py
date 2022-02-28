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

import os
import stat
import tarfile


def compare_files(file_a, file_b):
    while True:
        buf1 = file_a.read(16384)
        buf2 = file_b.read(16384)
        if buf1 != buf2:
            return False
        if not buf1:
            return True


def analyze_lowers(lowers):
    lower_files = {}
    for lower in lowers:
        for lower_member in lower.getmembers():
            dirname, basename = os.path.split(lower_member.name)
            if basename == '.wh..wh..opq':
                prefix = dirname + '/'
                to_delete = []
                for k in lower_files:
                    if k.startswith(prefix):
                        to_delete.append(k)
                for k in to_delete:
                    del lower_files[k]
            elif basename.startswith('.wh.'):
                del lower_files[os.path.join(dirname, basename[4:])]
            else:
                lower_files[lower_member.name] = lower

    lower_dir_contents = {}
    for file in lower_files:
        dirname, basename = os.path.split(file)
        if dirname not in lower_dir_contents:
            lower_dir_contents[dirname] = []
        lower_dir_contents[dirname].append(basename)

    return lower_files, lower_dir_contents


def dummy_tarinfo(name, original):
    tinfo = tarfile.TarInfo(name=name)
    tinfo.uid = original.uid
    tinfo.gid = original.gid
    tinfo.mode = original.mode
    tinfo.mtime = original.mtime
    tinfo.size = 0
    tinfo.type = tarfile.REGTYPE
    return tinfo


def create_layer(output, upper, lowers):
    lower_files, lower_dir_contents = analyze_lowers(lowers)

    epoch = os.environ.get('SOURCE_DATE_EPOCH')

    stack = [upper]
    while stack:
        root = stack.pop(-1)

        root_rel = os.path.relpath(root, upper)

        dir_tinfo = output.gettarinfo(name=root, arcname=root_rel)
        if epoch:
            dir_tinfo.mtime = int(epoch)
        output.addfile(dir_tinfo)

        files = []
        dirs = []
        with os.scandir(root) as entries:
            for entry in entries:
                if entry.is_dir(follow_symlinks=False):
                    dirs.append(entry.name)
                else:
                    files.append(entry.name)

        for directory in reversed(sorted(dirs)):
            stack.append(os.path.join(root, directory))

        for old_file in lower_dir_contents.get(root_rel, []):
            if old_file not in files and old_file not in dirs:
                full_path = os.path.join(root_rel, old_file)
                old_tar = lower_files[full_path]
                old_info = old_tar.getmember(full_path)
                new_name = os.path.join(root_rel, f'.wh.{old_file}')
                wh_tinfo = dummy_tarinfo(new_name, old_info)
                output.addfile(wh_tinfo)

        for file in sorted(files):
            path = os.path.join(root, file)
            rel = os.path.join(root_rel, file)
            tinfo = output.gettarinfo(name=path, arcname=rel)
            tinfo.mode = stat.S_IMODE(tinfo.mode)
            if epoch is not None:
                tinfo.mtime = int(epoch)
            if rel in lower_files:
                tar_file = lower_files[rel]
                lower_found = tar_file.getmember(rel)
                same_info = True

                for attr in 'type', 'uid', 'gid', 'mode', 'mtime', 'size':
                    if getattr(tinfo, attr) != getattr(lower_found, attr):
                        same_info = False
                        break

                if same_info:
                    if tinfo.type == tarfile.REGTYPE:
                        with open(path, 'rb') as new_file:
                            if compare_files(tar_file.extractfile(lower_found), new_file):
                                # We already added file to inode cache so we clean it up
                                output.inodes = {
                                    inode: arcname for inode, arcname in output.inodes.items()
                                    if arcname != tinfo.name
                                }
                                continue
                    elif tinfo.type == tarfile.LNKTYPE:
                        # File is already in tarfile so we don't need to test anything
                        pass
                    elif tinfo.type == tarfile.SYMTYPE:
                        if tinfo.linkname == os.readlink(path):
                            continue
                    else:
                        raise RuntimeError(
                            f"{path} unexpected type {tinfo.type}"
                        )

            if tinfo.type == tarfile.REGTYPE:
                with open(path, 'rb') as file_stream:
                    output.addfile(tinfo, file_stream)
            else:
                output.addfile(tinfo)
