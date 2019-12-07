kind: autotools
description: X.org lib xshmfence

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
        - '%{libdir}/libxshmfence.so'

sources:
- kind: tar
  url: tar_https:www.x.org/archive/individual/lib/libxshmfence-1.3.tar.bz2
  ref: b884300d26a14961a076fbebc762a39831cb75f92bed5ccf9836345b459220c7
