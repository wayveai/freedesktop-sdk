kind: myautotools
description: X.org lib xtst

depends:
  - filename: base-stack.bst
  - filename: desktop/xorg-proto-record.bst
  - filename: desktop/xorg-proto-input.bst
  - filename: desktop/xorg-proto-xext.bst
  - filename: desktop/xorg-lib-x11.bst
  - filename: desktop/xorg-lib-xext.bst
  - filename: desktop/xorg-lib-xi.bst

sources:
  - kind: tar
    url: https://www.x.org/archive/individual/lib/libXtst-1.2.3.tar.bz2
    ref: 4655498a1b8e844e3d6f21f3b2c4e2b571effb5fd83199d428a6ba7ea4bf5204
