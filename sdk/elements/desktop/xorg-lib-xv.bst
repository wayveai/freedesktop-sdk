kind: myautotools
description: X.org lib xv

depends:
  - filename: base.bst
    type: build
  - filename: desktop/xorg-proto-video.bst
  - filename: desktop/xorg-proto-xext.bst
  - filename: desktop/xorg-lib-x11.bst
  - filename: desktop/xorg-lib-xext.bst

public:
  bst:
    split-rules:
      devel:
        - "%{libdir}/libXv.so"

sources:
  - kind: tar
    url: https://www.x.org/archive/individual/lib/libXv-1.0.11.tar.bz2
    ref: d26c13eac99ac4504c532e8e76a1c8e4bd526471eb8a0a4ff2a88db60cb0b088
