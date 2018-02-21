kind: autotools
description: X.Org combined protocol headers

depends:
  - filename: base.bst
    type: build
  - filename: desktop/xorg-util-macros.bst
    type: build

sources:
  - kind: git
    url: git://anongit.freedesktop.org/xorg/proto/xorgproto
    track: master
    ref: c1c8cf73601e0e1fee843d338b3f0f5cc0bf1c17 #  xorgproto-2018.2-3-gc1c8cf7
