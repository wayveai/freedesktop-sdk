kind: autotools
description: X.org lib xdamage

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-xfixes.bst
- filename: components/xorg-lib-x11.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXdamage.so'

sources:
- kind: git_tag
  url: freedesktop:xorg/lib/libxdamage.git
  track: master
  ref: libXdamage-1.1.5-0-g977b04cd69738806e0b48fcf5c725763d065f06d
