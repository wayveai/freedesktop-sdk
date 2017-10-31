kind: myautotools
description: X.org lib xcb

depends:
  - filename: base-stack.bst
  - filename: desktop/xorg-proto-x.bst
  - filename: desktop/xorg-proto-xcb.bst
  - filename: desktop/xorg-util-macros.bst
  - filename: desktop/xorg-lib-xau.bst
  - filename: desktop/xorg-lib-pthread-stubs.bst

variables:
  conf-extra: |
    --enable-xkb \
    --disable-xprint

sources:
  - kind: tar
    url: https://xcb.freedesktop.org/dist/libxcb-1.12.tar.bz2
    ref: 4adfb1b7c67e99bc9c2ccb110b2f175686576d2f792c8a71b9c8b19014057b5b
