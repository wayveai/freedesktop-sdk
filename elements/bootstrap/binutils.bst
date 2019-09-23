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

environment:
  LEXLIB: ' '

sources:
- kind: tar
  url: sourceware_pub:binutils/releases/binutils-2.31.1.tar.xz
  ref: 5d20086ecf5752cc7d9134246e9588fa201740d540f7eb84d795b1f7a93bca86
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
- kind: patch
  path: patches/binutils/binutils-CVE-2018-20002.patch
- kind: patch
  path: patches/binutils/binutils-CVE-2019-9071.patch
- kind: patch
  path: patches/binutils/binutils-CVE-2019-9073.patch
- kind: patch
  path: patches/binutils/binutils-CVE-2019-9074.patch
- kind: patch
  path: patches/binutils/binutils-CVE-2019-9075.patch
- kind: patch
  path: patches/binutils/binutils-CVE-2019-9077.patch
- kind: patch
  path: patches/binutils/binutils-CVE-2018-1000876.patch

public:
  bst:
    split-rules:
      runtime: []
      devel:
      - /**

  cpe:
    patches:
      - CVE-2018-17358
      - CVE-2018-17359 # same fix as CVE-2018-17358
      - CVE-2018-17360
      - CVE-2018-20623
      - CVE-2018-20651
      - CVE-2018-20671
      - CVE-2018-20002
      - CVE-2018-1000876
      - CVE-2019-9071
      - CVE-2019-9073
      - CVE-2019-9074
      - CVE-2019-9075
      - CVE-2019-9077
