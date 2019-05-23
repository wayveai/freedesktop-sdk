#!/usr/bin/env python3

import sys
import yaml
import contextlib
import tempfile
import subprocess

path, old_file, old_hex, old_mode, new_file, new_hex, new_mode = \
    tuple(sys.argv[1:])

def diff(path, old, new):
    subprocess.run(["diff", '-u',
                    '--label=a/{}'.format(path),
                    '--label=b/{}'.format(path),
                    old, new])

with contextlib.ExitStack() as stack:
    try:
        old_data = yaml.load(stack.enter_context(open(old_file, 'r')))
        new_data = yaml.load(stack.enter_context(open(new_file, 'r')))
    except:
        diff(path, old_file, new_file)
    else:
        old_formatted = stack.enter_context(tempfile.NamedTemporaryFile(mode='w'))
        new_formatted = stack.enter_context(tempfile.NamedTemporaryFile(mode='w'))
        yaml.dump(old_data, old_formatted, default_flow_style=False)
        yaml.dump(new_data, new_formatted, default_flow_style=False)
        diff(path, old_formatted.name, new_formatted.name)
