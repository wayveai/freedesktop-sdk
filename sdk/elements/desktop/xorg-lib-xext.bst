kind: myautotools
description: X.org lib xext

depends:
  - filename: base.bst
    type: build
  - filename: desktop/xorg-proto-x.bst
  - filename: desktop/xorg-proto-xext.bst
  - filename: desktop/xorg-lib-x11.bst

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libXext.so"

sources:
  - kind: tar
    url: https://www.x.org/archive/individual/lib/libXext-1.3.3.tar.bz2
    ref: b518d4d332231f313371fdefac59e3776f4f0823bcb23cf7c7305bfb57b16e35
