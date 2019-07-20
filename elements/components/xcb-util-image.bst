kind: autotools
description: X.org xcb-util-image

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-xcb.bst
- filename: components/xcb-util.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

variables:
  autogen: autoreconf -fvi

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libxcb-image.so'

sources:
- kind: git_tag
  url: freedesktop:xorg/lib/libxcb-image.git
  track: master
  ref: 0.4.0-0-gd882052fb2ce439c6483fce944ba8f16f7294639
  submodules:
    m4:
      url: freedesktop:xorg/util/xcb-util-m4.git
      checkout: True
