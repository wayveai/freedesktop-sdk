kind: autotools
description: GNU ncurses stage 1

depends:
- filename: dependencies/base-sdk.bst
  type: build
- filename: gnu-config.bst
  type: build

variables:
  prefix: '%{tools}'
  libdir: '%{tools}/lib'
  build-triplet: '%{guessed-triplet}'
  host-triplet: '%{guessed-triplet}'
  conf-link-args: --without-shared
  conf-local: |
    --without-ada \
    --with-normal \
    --enable-widec

sources:
- kind: tar
  url: ftp_gnu_org:ncurses/ncurses-6.1.tar.gz
  ref: aa057eeeb4a14d470101eff4597d5833dcef5965331be3528c08d99cebaa0d17
