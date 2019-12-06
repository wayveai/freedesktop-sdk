kind: autotools
description: X.org lib ICE

depends:
- filename: bootstrap-import.bst
- filename: desktop/xorg-proto-xorgproto.bst
- filename: desktop/xorg-lib-xtrans.bst
- filename: base/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libICE.so'

sources:
- kind: tar
  url: tar_https:www.x.org/archive/individual/lib/libICE-1.0.9.tar.bz2
  ref: 8f7032f2c1c64352b5423f6b48a8ebdc339cc63064af34d66a6c9aa79759e202
