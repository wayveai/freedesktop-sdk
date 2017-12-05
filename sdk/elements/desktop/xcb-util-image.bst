kind: myautotools
description: X.org xcb-util-image

depends:
  - filename: base.bst
    type: build
  - filename: desktop/xorg-lib-xcb.bst
  - filename: desktop/xorg-lib-pthread-stubs.bst
  - filename: desktop/xcb-util.bst

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libxcb-image.so"

sources:
  - kind: tar
    url: https://www.x.org/archive/individual/xcb/xcb-util-image-0.4.0.tar.bz2
    ref: 2db96a37d78831d643538dd1b595d7d712e04bdccf8896a5e18ce0f398ea2ffc
