#!/usr/bin/env python3

"""This tool runs review-tools.snap-review and parses its output.
Every error that is because it requires a manual review from the snap
store is ignored for the return status.
"""

import json
import sys
import subprocess

has_error = False

p = subprocess.Popen(["snap-review", "--json", sys.argv[1]],
                     universal_newlines=True,
                     stdout=subprocess.PIPE)
output, _ = p.communicate()

if p.returncode == 1:
    sys.stderr.write('review-tools.snap-review crashed\n'.format(p.returncode))
    sys.exit(1)
elif p.returncode == 0:
    sys.stderr.write('No error found\n'.format(p.returncode))
    pass
elif p.returncode in [2, 3]:
    sys.stderr.write('Some issues found. Processing...\n'.format(p.returncode))
    pass
else:
    sys.stderr.write('Unknown return code {}\n'.format(p.returncode))
    sys.exit(1)

data = json.loads(output)
for section, section_value in data.items():
    for error, error_value in section_value["error"].items():
        if error_value["manual_review"]:
            sys.stderr.write('{}:{}: (MANUAL REVIEW) {}\n'.format(section, error, error_value["text"]))
        else:
            sys.stderr.write('{}:{}: (ERROR) {}\n'.format(section, error, error_value["text"]))
            has_error = True
    for warning, warning_value in section_value["warn"].items():
        sys.stderr.write('{}:{}: (WARNING) {}\n'.format(section, warning, warning_value["text"]))
    for info, info_value in section_value["info"].items():
        sys.stderr.write('{}:{}: (INFO) {}\n'.format(section, info, info_value["text"]))

if has_error:
    sys.exit(1)
else:
    sys.exit(0)
