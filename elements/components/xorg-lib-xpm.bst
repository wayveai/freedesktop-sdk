kind: autotools
description: X.org lib xpm

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
        - '%{libdir}/libXpm.so'

sources:
- kind: git_tag
  url: freedesktop:xorg/lib/libxpm.git
  track: master
  ref: libXpm-3.5.12-0-g1fab5e81fd761f628fb68d22934615536dbd0220
