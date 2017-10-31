kind: myautotools

depends:
  - filename: base-stack.bst
  - filename: desktop/graphite2.bst
  - filename: desktop/freetype-stage1.bst
    type: build

variables:
  conf-extra: |
    --with-gobject \
    --with-graphite2

sources:
  - kind: tar
    url: https://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.6.3.tar.bz2
    ref: e31eb367beb61a9399d2c78b51c225ab2b1cbd46f364f2d80d97bb422b44101a
