kind: autotools
description: X.org lib xfixes

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
        - '%{libdir}/libXfixes.so'
  cpe:
    product: libxfixes

sources:
- kind: git_tag
  url: freedesktop:xorg/lib/libxfixes.git
  track: master
  ref: libXfixes-6.0.0-0-g6fe3bd64dd82f704ed91478acb4c99ab5c00be16
