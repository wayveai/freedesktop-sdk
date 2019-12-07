kind: autotools
description: X.org lib xv

depends:
- filename: bootstrap-import.bst
- filename: desktop/xorg-lib-x11.bst
- filename: desktop/xorg-lib-xext.bst
- filename: base/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXv.so'
  cpe:
    product: libxv

sources:
- kind: tar
  url: tar_https:www.x.org/archive/individual/lib/libXv-1.0.11.tar.bz2
  ref: d26c13eac99ac4504c532e8e76a1c8e4bd526471eb8a0a4ff2a88db60cb0b088
