kind: autotools
description: GNU Binutils

depends:
- filename: bootstrap/binutils-build-deps.bst
  type: build
- filename: bootstrap/glibc.bst
  type: runtime

(@): elements/bootstrap/target.yml

# '-fno-exceptions' nullifies '-fexceptions' which breaks build on arm.
# https://gitlab.com/freedesktop-sdk/freedesktop-sdk/-/jobs/110741993
# FIXME: what happens when we make it depend on gcc.bst? Does it it fix it?

variables:
  conf-local: |
    CFLAGS="${CFLAGS} -fno-exceptions" \
    --disable-werror \
    --with-lib-path="%{libdir}:%{indep-libdir}" \
    --enable-gold \
    --enable-ld=default \
    --enable-shared \
    --enable-plugins \
    --disable-gdb \
    --disable-sim \
    --disable-readline \
    --disable-libdecnumber \
    host_configargs='lt_cv_sys_lib_dlsearch_path_spec="/usr/lib/%{gcc_triplet}"'

config:
  install-commands:
    (>):
    - |
      if [ -e "%{install-root}%{prefix}/%{triplet}/bin/ld.bfd" ]; then
        rm "%{install-root}%{prefix}/%{triplet}/bin/ld"
        ln -s ld.bfd "%{install-root}%{prefix}/%{triplet}/bin/ld"
      fi

    - |
      for tool in "%{install-root}%{prefix}/%{triplet}/bin"/*; do
        toolbase="$(basename "${tool}")"
        for link in "%{bindir}/%{triplet}-${toolbase}" "%{bindir}/${toolbase}"; do
          if [ -f "%{install-root}${link}" ]; then
            rm "%{install-root}${link}"
            ln -s "$(realpath "${tool}" --relative-to="$(dirname "%{install-root}${link}")")" "%{install-root}${link}"
          fi
        done
      done

    - |
      rm "%{install-root}%{infodir}/dir"

environment:
  LEXLIB: ' '

sources:
- kind: git_tag
  url: sourceware:binutils-gdb.git
  track: binutils-2_31-branch
  ref: binutils-2_31_1-0-g0860693812fff944ab0602e72b762a4a2078da5b
- kind: patch
  path: patches/binutils/CVE-2018-17358.patch
- kind: patch
  path: patches/binutils/CVE-2018-17360.patch
- kind: patch
  path: patches/binutils/CVE-2018-20623.patch
- kind: patch
  path: patches/binutils/CVE-2018-20651.patch
- kind: patch
  path: patches/binutils/CVE-2018-20671.patch

public:
  bst:
    split-rules:
      runtime: []
      devel:
      - /**

  cpe:
    version: 2.31.1
    patches:
    - CVE-2018-17358
    - CVE-2018-17359   # same fix as CVE-2018-17358
    - CVE-2018-17360
    - CVE-2018-20623
    - CVE-2018-20651
    - CVE-2018-20671
