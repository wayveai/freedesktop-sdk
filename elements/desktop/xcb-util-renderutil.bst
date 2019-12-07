kind: autotools
description: X.org xcb-util-renderutil

depends:
- filename: bootstrap-import.bst
- filename: desktop/xorg-lib-xcb.bst
- filename: base/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libxcb-render-util.so'

sources:
- kind: tar
  url: tar_https:www.x.org/archive/individual/xcb/xcb-util-renderutil-0.3.9.tar.bz2
  ref: c6e97e48fb1286d6394dddb1c1732f00227c70bd1bedb7d1acabefdd340bea5b
