kind: autotools
description: GNU Binutils

depends:
- filename: binutils-build-deps.bst
  type: build
- filename: glibc.bst
  type: runtime

(@): target.yml

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
    --enable-plugins

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

public:
  bst:
    split-rules:
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
