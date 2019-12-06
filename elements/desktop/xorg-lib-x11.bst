kind: autotools
description: X.org lib x11

depends:
- filename: bootstrap-import.bst
- filename: desktop/xorg-lib-xtrans.bst
- filename: desktop/xorg-lib-xcb.bst
- filename: base/perl.bst
  type: build
- filename: base/buildsystem-autotools.bst
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
- kind: tar
  url: tar_https:www.x.org/archive/individual/lib/libX11-1.6.7.tar.bz2
  ref: 910e9e30efba4ad3672ca277741c2728aebffa7bc526f04dcfa74df2e52a1348
