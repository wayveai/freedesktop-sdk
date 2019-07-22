kind: autotools
description: X.org lib xdmcp

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-proto-xorgproto.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXdmcp.so'

sources:
- kind: git_tag
  url: freedesktop:xorg/lib/libxdmcp.git
  track: master
  ref: libXdmcp-1.1.3-0-g618b3ba5f826d930df2ca6a6a0ce212fa75cef42
