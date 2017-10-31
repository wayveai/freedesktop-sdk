kind: myautotools
description: X.org lib xfixes

depends:
  - filename: base-stack.bst
  - filename: desktop/xorg-proto-x.bst
  - filename: desktop/xorg-proto-fixes.bst
  - filename: desktop/xorg-proto-xext.bst
  - filename: desktop/xorg-lib-x11.bst

sources:
  - kind: tar
    url: https://www.x.org/archive/individual/lib/libXfixes-5.0.3.tar.bz2
    ref: de1cd33aff226e08cefd0e6759341c2c8e8c9faf8ce9ac6ec38d43e287b22ad6
