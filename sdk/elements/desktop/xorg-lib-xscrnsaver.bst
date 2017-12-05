kind: myautotools
description: X.org lib XScrnSaver

depends:
  - filename: base.bst
    type: build
  - filename: desktop/xorg-util-macros.bst
  - filename: desktop/xorg-lib-x11.bst
  - filename: desktop/xorg-lib-xext.bst
  - filename: desktop/xorg-proto-xext.bst
  - filename: desktop/xorg-proto-scrnsaver.bst

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libXss.so"

sources:
  - kind: tar
    url: https://www.x.org/archive/individual/lib/libXScrnSaver-1.2.2.tar.bz2
    ref: 8ff1efa7341c7f34bcf9b17c89648d6325ddaae22e3904e091794e0b4426ce1d
