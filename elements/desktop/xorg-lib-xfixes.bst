kind: autotools
description: X.org lib xfixes

depends:
- filename: bootstrap-import.bst
- filename: desktop/xorg-lib-x11.bst
- filename: base/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXfixes.so'
  cpe:
    product: libxfixes

sources:
- kind: tar
  url: tar_https:www.x.org/archive/individual/lib/libXfixes-5.0.3.tar.bz2
  ref: de1cd33aff226e08cefd0e6759341c2c8e8c9faf8ce9ac6ec38d43e287b22ad6
