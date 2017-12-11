#!/bin/bash

# This scans for symbolic link .so libraries that have a SONAME which
# is not the name of the symbolic link. Those files should not appear in
# platform runtimes, only in SDKs.

find "$1" -type l -name "lib*.so" -print0 |
while IFS= read -r -d '' file; do
    basename="$(basename "${file}")"
    soname="$(objdump -p "${file}" | sed "/ *SONAME */{;s///;q;};d")"
    if [ -n "${soname}" ] && [ "x${soname}" != "x${basename}" ]; then
        realpath -s --relative-to="$1" "${file}"
    fi
done
