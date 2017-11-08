kind: myautotools
description: X.org lib xshmfence

depends:
  - filename: base-stack.bst
    type: build
  - filename: desktop/xorg-proto-x.bst

public:
  bst:
    split-rules:
      devel:
        - "%{libdir}/libxshmfence.so"

sources:
  - kind: tar
    url: https://www.x.org/archive/individual/lib/libxshmfence-1.2.tar.bz2
    ref: d21b2d1fd78c1efbe1f2c16dae1cb23f8fd231dcf891465b8debe636a9054b0c
