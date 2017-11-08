kind: myautotools
description: X.org lib xi

depends:
  - filename: base-stack.bst
    type: build
  - filename: desktop/xorg-proto-x.bst
  - filename: desktop/xorg-proto-xext.bst
  - filename: desktop/xorg-proto-input.bst
  - filename: desktop/xorg-lib-x11.bst
  - filename: desktop/xorg-lib-xext.bst
  - filename: desktop/xorg-lib-xfixes.bst

variables:
  conf-extra: |
    --disable-specs

public:
  bst:
    split-rules:
      devel:
        - "%{libdir}/libXi.so"

sources:
  - kind: tar
    url: https://www.x.org/archive/individual/lib/libXi-1.7.9.tar.bz2
    ref: c2e6b8ff84f9448386c1b5510a5cf5a16d788f76db018194dacdc200180faf45
