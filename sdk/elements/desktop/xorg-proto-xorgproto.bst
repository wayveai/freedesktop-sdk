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
    ref: bd1c33db522396e81edd47b2943ebae219a07c01 #  xorgproto-2018.1
