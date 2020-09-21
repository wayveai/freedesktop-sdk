kind: autotools
description: X.org xcb-util-cursor

depends:
- filename: bootstrap-import.bst
- filename: components/xcb-util-renderutil.bst
- filename: components/xcb-util-image.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build
- filename: components/gperf.bst
  type: build

variables:
  autogen: autoreconf -fvi
  builddir: ''

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libxcb-cursor.so'

sources:
- kind: git_tag
  url: freedesktop:xorg/lib/libxcb-cursor.git
  track: master
  ref: 0.1.3-0-g95b9a8fd876fdbbc854cdf3d90317be3846c7417
- kind: git_module
  path: m4
  url: freedesktop:xorg/util/xcb-util-m4.git
  ref: 177e4afb9b57a7b7589c15d8a9bd85b4a5524128
