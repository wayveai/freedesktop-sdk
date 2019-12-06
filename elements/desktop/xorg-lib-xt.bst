kind: autotools
description: X.org lib Xt

depends:
- filename: bootstrap-import.bst
- filename: desktop/xorg-lib-x11.bst
- filename: desktop/xorg-lib-sm.bst
- filename: desktop/xorg-lib-ice.bst
- filename: base/buildsystem-autotools.bst
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
- kind: tar
  url: tar_https:www.x.org/archive/individual/lib/libXt-1.1.5.tar.bz2
  ref: 46eeb6be780211fdd98c5109286618f6707712235fdd19df4ce1e6954f349f1a
