kind: meson
description: X.Org combined protocol headers

depends:
  - filename: bootstrap-import.bst
  - filename: base/meson.bst
    type: build
  - filename: base/ninja.bst
    type: build
  - filename: desktop/xorg-util-macros.bst
    type: build

public:
  bst:
    split-rules:
      devel:
        - "/**"

sources:
  - kind: git
    url: freedesktop:xorg/proto/xorgproto
    track: master
    ref: cd7b5a4bee3d3ae2c72820406ccf3a5bc4bd82d0 #  xorgproto-2018.3
