kind: autotools
description: X.org lib ICE

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-proto-xorgproto.bst
- filename: components/xorg-lib-xtrans.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libICE.so'

sources:
- kind: git_tag
  url: freedesktop:xorg/lib/libice.git
  track: master
  ref: libICE-1.0.10-0-g8e6a14c63d6b73cde87cb331439f2a4d19cba5b9
