kind: myautotools
description: X.org lib SM

depends:
  - filename: base-stack.bst
  - filename: desktop/xorg-lib-ice.bst
  - filename: desktop/xorg-proto-x.bst
  - filename: desktop/xorg-lib-xtrans.bst

sources:
  - kind: tar
    url: https://www.x.org/archive/individual/lib/libSM-1.2.2.tar.bz2
    ref: 0baca8c9f5d934450a70896c4ad38d06475521255ca63b717a6510fdb6e287bd
