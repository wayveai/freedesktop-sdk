kind: autotools
description: X.org proto xcb

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
  type: build
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

sources:
- kind: git_tag
  url: freedesktop:xorg/proto/xcbproto.git
  track: master
  ref: xcb-proto-1.14-0-g73d84bf39be7f3d8c90d7494bd4641456f2c8ef9
