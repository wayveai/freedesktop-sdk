kind: autotools
description: GNU coreutils

depends:
- filename: dependencies/base-sdk.bst
  type: build

variables:
  conf-args: |
    --enable-install-program=hostname \
    --mandir=/coreutils-manpages

config:
  install-commands:
    - |
      cd "%{builddir}"
      make -j1 install-man DESTDIR="%{install-root}"

sources:
- kind: tar
  url: http://ftp.gnu.org/gnu/coreutils/coreutils-8.29.tar.xz
  ref: 92d0fa1c311cacefa89853bdb53c62f4110cdfda3820346b59cbd098f40f955e
