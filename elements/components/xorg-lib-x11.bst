kind: autotools
description: X.org lib x11

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-xtrans.bst
- filename: components/xorg-lib-xcb.bst
- filename: components/perl.bst
  type: build
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libX11.so'
        - '%{libdir}/libX11-xcb.so'
  cpe:
    product: libx11

sources:
- kind: git_tag
  url: freedesktop:xorg/lib/libx11.git
  track: master
  ref: libX11-1.7.3.1-0-g4c96f3567a8d045ee57b886fddc9618b71282530
