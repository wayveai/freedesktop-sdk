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
  ref: xcb-proto-1.13-0-g94228cde97d9aecfda04a8e699d462ba2b89e3a0
