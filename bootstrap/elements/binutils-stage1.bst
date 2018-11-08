kind: autotools
description: GNU Binutils Stage 1

depends:
- filename: dependencies/base-sdk.bst
- filename: gnu-config.bst
  type: build

(@): build.yml

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
