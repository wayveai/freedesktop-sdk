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
  ref: libX11-1.7.2-0-gf906fe8e9769e4313294b68e61c402610ade69da
