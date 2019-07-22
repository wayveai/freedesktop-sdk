kind: autotools
description: X.org xcb-util

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-xau.bst
- filename: components/xorg-lib-xcb.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libxcb-util.so'

sources:
- kind: git_tag
  url: freedesktop:xorg/lib/libxcb-util.git
  track: master
  ref: 0.4.0-0-gacf790d7752f36e450d476ad79807d4012ec863b
  submodules:
    m4:
      url: freedesktop:xorg/util/xcb-util-m4.git
      checkout: True
