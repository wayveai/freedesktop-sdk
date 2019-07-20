kind: autotools
description: X.org lib XScrnSaver

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
        - '%{libdir}/libXss.so'

sources:
- kind: git_tag
  url: freedesktop:xorg/lib/libxscrnsaver.git
  track: master
  ref: libXScrnSaver-1.2.3-0-g96fffcd9dcaf2ba37ec56aa798677de9ad58ae81
