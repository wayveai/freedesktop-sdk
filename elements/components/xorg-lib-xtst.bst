kind: autotools
description: X.org lib xtst

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-x11.bst
- filename: components/xorg-lib-xext.bst
- filename: components/xorg-lib-xi.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXtst.so'
  cpe:
    product: libxtst

sources:
- kind: git_tag
  url: freedesktop:xorg/lib/libxtst.git
  track: master
  ref: libXtst-1.2.3-0-g9f5621a410f18149d4c76b02daa7f1a98b4a2c16
