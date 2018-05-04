kind: meson
description: X.Org combined protocol headers

depends:
  - filename: base.bst
    type: build
  - filename: desktop/xorg-util-macros.bst
    type: build

sources:
  - kind: git
    url: freedesktop:xorg/proto/xorgproto
    track: master
    ref: cd7b5a4bee3d3ae2c72820406ccf3a5bc4bd82d0 #  xorgproto-2018.3
