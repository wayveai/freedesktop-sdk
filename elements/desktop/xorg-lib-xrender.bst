kind: autotools
description: X.org lib xrender

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
        - '%{libdir}/libXrender.so'
  cpe:
    product: libxrender

sources:
- kind: tar
  url: tar_https:www.x.org/archive/individual/lib/libXrender-0.9.10.tar.bz2
  ref: c06d5979f86e64cabbde57c223938db0b939dff49fdb5a793a1d3d0396650949
