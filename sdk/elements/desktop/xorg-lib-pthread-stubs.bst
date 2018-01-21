kind: autotools
description: X.org dist pthread stubs

depends:
  - filename: base.bst
    type: build

sources:
  - kind: tar
    url: https://xcb.freedesktop.org/dist/libpthread-stubs-0.4.tar.bz2
    ref: e4d05911a3165d3b18321cc067fdd2f023f06436e391c6a28dff618a78d2e733
