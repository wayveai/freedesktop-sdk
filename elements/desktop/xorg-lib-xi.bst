kind: autotools
description: X.org lib xi

depends:
- filename: bootstrap-import.bst
- filename: desktop/xorg-lib-x11.bst
- filename: desktop/xorg-lib-xext.bst
- filename: desktop/xorg-lib-xfixes.bst
- filename: base/buildsystem-autotools.bst
  type: build

variables:
  conf-local: |
    --disable-specs

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXi.so'
  cpe:
    product: libxi

sources:
- kind: tar
  url: tar_https:www.x.org/archive/individual/lib/libXi-1.7.9.tar.bz2
  ref: c2e6b8ff84f9448386c1b5510a5cf5a16d788f76db018194dacdc200180faf45
