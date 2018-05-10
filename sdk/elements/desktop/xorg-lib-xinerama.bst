kind: autotools
description: X.org lib xinerama

depends:
  - filename: desktop/xorg-lib-x11.bst
  - filename: desktop/xorg-lib-xext.bst
  - filename: base/pkg-config.bst
    type: build

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libXinerama.so"

sources:
  - kind: tar
    url: https://www.x.org/archive/individual/lib/libXinerama-1.1.3.tar.bz2
    ref: 7a45699f1773095a3f821e491cbd5e10c887c5a5fce5d8d3fced15c2ff7698e2
