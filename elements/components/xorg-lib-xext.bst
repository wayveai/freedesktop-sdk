kind: autotools
description: X.org lib xext

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
        - '%{libdir}/libXext.so'
  cpe:
    product: libxext

sources:
- kind: git_tag
  url: freedesktop:xorg/lib/libxext.git
  track: master
  ref: libXext-1.3.4-0-gebb167f34a3514783966775fb12573c4ed209625
