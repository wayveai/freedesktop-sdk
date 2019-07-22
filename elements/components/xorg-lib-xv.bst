kind: autotools
description: X.org lib xv

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-x11.bst
- filename: components/xorg-lib-xext.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXv.so'
  cpe:
    product: libxv

sources:
- kind: git_tag
  url: freedesktop:xorg/lib/libxv.git
  track: master
  ref: libXv-1.0.11-0-gef2a282876acc2316d338f8b66344ad5a2947057
