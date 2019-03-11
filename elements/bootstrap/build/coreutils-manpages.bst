kind: autotools
description: GNU coreutils

(@): elements/bootstrap/build.yml

depends:
- filename: bootstrap/build/base-sdk.bst
  type: build

environment:
  FORCE_UNSAFE_CONFIGURE: 1

variables:
  conf-local: |
    --enable-install-program=hostname \
    --mandir=/coreutils-manpages

config:
  install-commands:
  - |
    cd "%{builddir}"
    make -j1 install-man DESTDIR="%{install-root}"

sources:
- kind: tar
  url: ftp_gnu_org:coreutils/coreutils-8.31.tar.xz
  ref: ff7a9c918edce6b4f4b2725e3f9b37b0c4d193531cac49a48b56c4d0d3a9e9fd
