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
  ref: libX11-1.6.11-0-g0d8f038db83f68724a84ef9d4ccd0d5e33ec6a70
