kind: autotools
description: X.org proto X

depends:
  - filename: base.bst
    type: build
  - filename: desktop/xorg-util-macros.bst
    type: build

sources:
  - kind: tar
    url: https://www.x.org/archive/individual/proto/xproto-7.0.31.tar.gz
    ref: 6d755eaae27b45c5cc75529a12855fed5de5969b367ed05003944cf901ed43c7
