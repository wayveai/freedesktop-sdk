kind: autotools
description: X.org lib Xau

depends:
  - filename: base.bst
    type: build
  - filename: desktop/xorg-proto-x.bst

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libXau.so"

sources:
  - kind: tar
    url: https://www.x.org/archive/individual/lib/libXau-1.0.8.tar.bz2
    ref: fdd477320aeb5cdd67272838722d6b7d544887dfe7de46e1e7cc0c27c2bea4f2
