kind: autotools
description: X.org lib Xau

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-proto-xorgproto.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXau.so'

sources:
- kind: git_tag
  url: freedesktop:xorg/lib/libxau.git
  track: master
  ref: libXau-1.0.9-0-gd9443b2c57b512cfb250b35707378654d86c7dea
