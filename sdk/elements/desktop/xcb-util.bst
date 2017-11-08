kind: myautotools
description: X.org xcb-util

depends:
  - filename: base-stack.bst
    type: build
  - filename: desktop/xorg-lib-xau.bst
  - filename: desktop/xorg-lib-xcb.bst
  - filename: desktop/xorg-lib-pthread-stubs.bst

public:
  bst:
    split-rules:
      devel:
        - "%{libdir}/libxcb-util.so"

sources:
  - kind: tar
    url: https://www.x.org/archive/individual/xcb/xcb-util-0.4.0.tar.bz2
    ref: 46e49469cb3b594af1d33176cd7565def2be3fa8be4371d62271fabb5eae50e9
