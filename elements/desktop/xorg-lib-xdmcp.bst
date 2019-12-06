kind: autotools
description: X.org lib xdmcp

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
        - '%{libdir}/libXdmcp.so'

sources:
- kind: tar
  url: tar_https:www.x.org/archive/individual/lib/libXdmcp-1.1.2.tar.bz2
  ref: 81fe09867918fff258296e1e1e159f0dc639cb30d201c53519f25ab73af4e4e2
