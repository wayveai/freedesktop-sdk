kind: myautotools
description: X.org xcb-util-wm

depends:
  - filename: base.bst
    type: build
  - filename: desktop/xorg-lib-xcb.bst

public:
  bst:
    split-rules:
      devel:
        - "%{libdir}/libxcb-ewmh.so"
        - "%{libdir}/libxcb-icccm.so"

sources:
  - kind: tar
    url: https://www.x.org/archive/individual/xcb/xcb-util-wm-0.4.1.tar.bz2
    ref: 28bf8179640eaa89276d2b0f1ce4285103d136be6c98262b6151aaee1d3c2a3f
