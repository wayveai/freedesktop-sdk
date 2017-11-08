kind: myautotools
description: X.org lib SM

depends:
  - filename: base-stack.bst
    type: build
  - filename: desktop/xorg-lib-ice.bst
  - filename: desktop/xorg-proto-x.bst
  - filename: desktop/xorg-lib-xtrans.bst

public:
  bst:
    split-rules:
      devel:
        - "%{libdir}/libSM.so"

sources:
  - kind: tar
    url: https://www.x.org/archive/individual/lib/libSM-1.2.2.tar.bz2
    ref: 0baca8c9f5d934450a70896c4ad38d06475521255ca63b717a6510fdb6e287bd
