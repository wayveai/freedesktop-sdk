#!/bin/sh
#
# This script tests if each element is bit-for-bit reproducible.
#
# It is required that this script is run as root.
#
# Example of use:
#
#   ./tests/test-reproducibility.sh flatpak-release.bst
#
# Extra parameters are passed to bst. The results.cache will be a cache of all
# results to not have to re-test already tested artifacts.
#

set -eu

clean_tmp() {
    if [ -n "${tmp}" ]; then
        rm -rf "${tmp}"
    fi
}

print_task() {
    echo ======================================================================
    echo "$1"
    echo ======================================================================
}

if [ $# -ne 1 ];  then
    echo "Usage: test-reproducibility.sh TARGET\n" 2>&1
    exit 1
fi

if [ $EUID -ne 0 ];  then
    echo "This script must be run as the root user\n" 2>&1
    exit 2
fi

target=$1 && shift
bst="bst $@"
tmp=

trap clean_tmp EXIT INT TERM

touch results.cache

print_task "Pulling artifacts"
${bst} pull --deps all "${target}"

print_task "Fetching sources"
${bst} fetch --deps all "${target}"

print_task "Building elements"
${bst} build --all "${target}"

${bst} show --deps all "${target}" \
    --format '%{name},%{full-key},%{state}' \
    2>/dev/null | while IFS=, read -r name ref state; do

    # Check whether the result is already cached
    result="$(sed "\|^${name}:${ref}:|{;s///;q;};d" results.cache)"
    case "${result}" in
         true)
             echo "${name} ${ref} is reproducible"
             continue
             ;;
         false)
             echo "${name} ${ref} is not reproducible"
             continue
             ;;
         failed)
             echo "${name} ${ref} failed to checkout"
             continue
             ;;
    esac

    print_task "Verifying ${name} bit-for-bit reproducibility"

    tmp=$(mktemp -td reproducible.XXXXXXXXXX)

    if ! ${bst} checkout "${name}" "${tmp}/a"; then
        echo "${name}:${ref}:failed" >> results.cache
        continue
    fi

    # TODO: use `bst artifacts delete` when implemented.
    find "${XDG_CACHE_HOME:-${HOME}/.cache}/buildstream/artifacts/cas/refs" -name "${ref}" -delete

    # TODO: use proper way of disabling artifact caches when implemented
    # instead of wrapping the command with unshare.
    unshare --net ${bst} build "${name}"

    ${bst} checkout "${name}" "${tmp}/b"

    if diff -r --no-dereference "${tmp}/a/" "${tmp}/b/"; then
        echo -e "${name} ${ref} is reproducible\n"
        result=true
    else
        echo -e "${name} ${ref} is not reproducible\n"
        result=false
    fi

    echo "${name}:${ref}:${result}" >> results.cache

    rm -rf "${tmp}"
done
