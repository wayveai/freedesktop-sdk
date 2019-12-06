kind: autotools
description: X.org lib Xau

depends:
- filename: bootstrap-import.bst
- filename: desktop/xorg-proto-xorgproto.bst
- filename: base/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXau.so'

sources:
- kind: tar
  url: tar_https:www.x.org/archive/individual/lib/libXau-1.0.8.tar.bz2
  ref: fdd477320aeb5cdd67272838722d6b7d544887dfe7de46e1e7cc0c27c2bea4f2
