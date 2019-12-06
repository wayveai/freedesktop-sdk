kind: autotools
description: X.org lib xinerama

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
        - '%{libdir}/libXinerama.so'
  cpe:
    product: libxinerama

sources:
- kind: tar
  url: tar_https:www.x.org/archive/individual/lib/libXinerama-1.1.4.tar.bz2
  ref: 0008dbd7ecf717e1e507eed1856ab0d9cf946d03201b85d5dcf61489bb02d720
