#!/bin/bash

# Copyright (c) 2019  Codethink Ltd.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# This script verifies RPATH/RUNPATH of executables and libraries in
# a sysroot. It looks and fails for:
#  1. useless RPATH that is the system library path (/usr/lib/x86_64-linux-gnu)
#  2. useless RPATH where no NEEDED library is present
#  3. relative RPATH paths
#  4. RPATH that do not exist.
#
# Notes:
#  - $ORIGIN is expanded and accepted as long as the resolved path exists.
#
#  - $LIB is not expanded. For now we expect it is not used because in
#    practice it is not used properly. So for now it will fail as the path
#    does not exist.

set -eu

bad_usage=no
if [ "${#}" -ne 2 ]; then
    bad_usage=yes
elif ! [ -d "${2}" ]; then
    bad_usage=yes
else
    case "${1}" in
	*-linux-*)
	;;
	*)
	    bad_usage=yes
	;;
    esac
fi

command -v objdump > /dev/null || { echo >&2 "objdump not found"; exit 1; }

if [ "${bad_usage}" = yes ]; then
    cat 1>&2 <<EOF
Bad command line.
Usage:
  ${0} TUPLE ROOTPATH

TUPLE is like x86_64-linux-gnu
ROOTPATH must be the root directory to check
EOF
    exit 1
fi

libpath="/usr/lib/${1}"

resolve_path() {
    root="${2}"
    case "${1}" in
	/*)
	;;
	*)
	    echo "Assertion break" 1>&2
	    exit 1
	;;
    esac
    path="${2}${1}"
    if [ "${path}" -ef "${root}" ]; then
	echo "/"
	return
    fi
    while [ -L "${path}" ]; do
	new_path="$(readlink "${path}")"
	case "${new_path}" in
	    /*)
		path="${root}${new_path}"
		;;
	    *)
		base="$(basename "${path}")"
		path="${base}${new_path}"
		;;
	esac
    done
    dir="$(dirname "${path}")"
    absdir="/$(realpath -m --no-symlinks --relative-to="${root}" "${dir}")"
    resolved_base="$(resolve_path "${absdir}" "${root}")"
    resolved="${resolved_base}/$(basename "${path}")"
    echo "/$(realpath -m --no-symlinks --relative-to="/" "${resolved}")"
}

eval_origin() {
    path="${1}"
    origin="${2}"
    root="${3}"

    origin="$(resolve_path "${origin}" "${root}")"
    origin="$(dirname "${origin}")"
    path="${path/\$ORIGIN/${origin}}"
    echo "${path}"
}

check_rpath() {
    if objdump -x "${2}" | grep "${1}" >/dev/null; then
	needed_libs=()
	for needed in $(objdump -x "${2}" | grep NEEDED | sed "s/ *NEEDED *//"); do
	    needed_libs+=("${needed}")
	done

	rpath="$(objdump -x "${2}" | grep "${1}" | sed "s/ *${1} *//")"
	abspath="/$(realpath -m --no-symlinks --relative-to="${3}" "${2}")"
	rpaths=()
	IFS=:
	for p in ${rpath}; do
	    rpaths+=("${p}")
	done
	unset IFS
	for p in "${rpaths[@]}"; do
	    evaled=$(eval_origin "${p}" "${abspath}" "${3}")
	    case "${evaled}" in
		/*)
		    resolved="$(resolve_path "${evaled}" "${3}")"
		    if [ "${resolved}" = "${libpath}" ]; then
			echo "${abspath}: ${rpath} has useless path (runtime)" 1>&2
			return 1
		    fi
		    if ! [ -d "${3}${resolved}" ]; then
			echo "${abspath}: ${rpath} has non-existent path" 1>&2
			return 1
		    fi
		    found_needed=no
		    for needed in "${needed_libs[@]}"; do
			n="$(resolve_path "${resolved}/${needed}" "${3}")"
			if [ -f "${3}${n}" ]; then
			    found_needed=yes
			    break
			fi
		    done
		    if [ "${found_needed}" = no ]; then
			echo "${abspath}: ${rpath} has useless path (no needed found)" 1>&2
			return 1
		    fi
		;;
		*)
		    echo "${abspath}: ${rpath} is relative" 1>&2
		    return 1
		;;
	    esac
	done
    fi
    return 0
}

find "${2}" -type f -not -name '*.debug' \
          '(' -perm -111 -o -name '*.so*' ')' \
          -print0 | (found_error=no; while read -r -d $'\0' file; do

    read -rn4 hdr <"${file}" || continue
    if [ "$hdr" != "$(printf \\x7fELF)" ]; then
        continue
    fi

    check_rpath RPATH "${file}" "${2}" || found_error=yes
    check_rpath RUNPATH "${file}" "${2}" || found_error=yes
done; [ "${found_error}" = no ])
