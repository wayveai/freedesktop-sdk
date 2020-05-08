kind: autotools
description: GNU ncurses stage 1

depends:
- filename: bootstrap/build/base-sdk.bst
  type: build
- filename: bootstrap/gnu-config.bst
  type: build

(@):
- elements/bootstrap/include/build.yml
- elements/bootstrap/include/ncurses-sources.yml

variables:
  prefix: '%{tools}'
  libdir: '%{tools}/lib'
  conf-link-args: --without-shared
  conf-local: |
    --without-ada \
    --with-normal \
    --enable-widec
