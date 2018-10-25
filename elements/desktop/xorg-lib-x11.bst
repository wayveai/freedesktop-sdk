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

sources:
- kind: tar
  url: https://www.x.org/archive/individual/lib/libX11-1.6.5.tar.bz2
  ref: 4d3890db2ba225ba8c55ca63c6409c1ebb078a2806de59fb16342768ae63435d
