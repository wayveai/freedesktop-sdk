kind: autotools

depends:
  - filename: base.bst
    type: build
  - filename: desktop/xorg-util-macros.bst
  - filename: desktop/xorg-proto-xorgproto.bst
  - filename: desktop/xorg-lib-x11.bst
  - filename: desktop/xorg-lib-xkbfile.bst

sources:
  - kind: tar
    url: https://www.x.org/archive/individual/app/xkbcomp-1.4.1.tar.bz2
    ref: 748dc4cf58ac95684106bd9cf163ac6ab7de9a236faec02a6f4d4006d63a5736

