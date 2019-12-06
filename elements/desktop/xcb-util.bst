kind: autotools
description: X.org xcb-util

depends:
- filename: bootstrap-import.bst
- filename: desktop/xorg-lib-xau.bst
- filename: desktop/xorg-lib-xcb.bst
- filename: base/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libxcb-util.so'

sources:
- kind: tar
  url: tar_https:www.x.org/archive/individual/xcb/xcb-util-0.4.0.tar.bz2
  ref: 46e49469cb3b594af1d33176cd7565def2be3fa8be4371d62271fabb5eae50e9
