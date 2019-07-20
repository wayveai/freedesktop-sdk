kind: autotools
description: X.org lib xrender

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-x11.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXrender.so'
  cpe:
    product: libxrender

sources:
- kind: git_tag
  url: freedesktop:xorg/lib/libxrender.git
  track: master
  ref: libXrender-0.9.10-0-g845716f8f14963d338e5a8d5d2424baafc90fb30
