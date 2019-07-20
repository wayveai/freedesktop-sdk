kind: autotools
description: X.org lib xinerama

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
        - '%{libdir}/libXinerama.so'
  cpe:
    product: libxinerama

sources:
- kind: git_tag
  url: freedesktop:xorg/lib/libxinerama.git
  track: master
  ref: libXinerama-1.1.4-0-gc3ab2361f13154921df2992f9eacc1ea1b3f946b
