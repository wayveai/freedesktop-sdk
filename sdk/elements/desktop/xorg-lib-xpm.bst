kind: myautotools
description: X.org lib xpm

depends:
  - filename: base.bst
    type: build
  - filename: desktop/xorg-util-macros.bst
  - filename: desktop/xorg-lib-x11.bst
  - filename: desktop/xorg-proto-x.bst

public:
  bst:
    split-rules:
      devel:
        - "%{libdir}/libXpm.so"

sources:
  - kind: tar
    url: https://www.x.org/archive/individual/lib/libXpm-3.5.12.tar.bz2
    ref: fd6a6de3da48de8d1bb738ab6be4ad67f7cb0986c39bd3f7d51dd24f7854bdec
