kind: autotools
description: X.org lib Xt

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-x11.bst
- filename: components/xorg-lib-sm.bst
- filename: components/xorg-lib-ice.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXt.so'
  cpe:
    product: libxt

sources:
- kind: git_tag
  url: freedesktop:xorg/lib/libxt.git
  track: master
  ref: libXt-1.2.0-0-g93ffd50ccf04d02fc94565d8ee831c7b63d6d71a
