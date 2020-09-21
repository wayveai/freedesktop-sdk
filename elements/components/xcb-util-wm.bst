kind: autotools
description: X.org xcb-util-wm

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-xcb.bst
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
        - '%{libdir}/libxcb-ewmh.so'
        - '%{libdir}/libxcb-icccm.so'

sources:
- kind: git_tag
  url: freedesktop:xorg/lib/libxcb-wm.git
  track: master
  ref: 0.4.1-0-g24eb17df2e1245885e72c9d4bbb0a0f69f0700f2
- kind: git_module
  path: m4
  url: freedesktop:xorg/util/xcb-util-m4.git
  ref: f662e3a93ebdec3d1c9374382dcc070093a42fed
