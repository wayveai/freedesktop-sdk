kind: autotools
description: GNU coreutils

(@): build.yml

depends:
- filename: dependencies/base-sdk.bst
  type: build

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
  url: ftp_gnu_org:coreutils/coreutils-8.30.tar.xz
  ref: e831b3a86091496cdba720411f9748de81507798f6130adeaef872d206e1b057
