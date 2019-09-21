kind: autotools
description: GNU Binutils Stage 1

depends:
- filename: bootstrap/build/base-sdk.bst
- filename: bootstrap/gnu-config.bst
  type: build

(@): elements/bootstrap/build.yml

variables:
  lib: lib
  prefix: '%{tools}'
  conf-local: |
    --target=%{triplet} \
    --with-sysroot=%{sysroot} \
    --disable-nls \
    --disable-multilib \
    --disable-werror \
    --with-lib-path="%{sysroot}/usr/lib/%{gcc_triplet}:%{sysroot}/usr/lib:/usr/lib/%{gcc_triplet}:/usr/lib"

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
