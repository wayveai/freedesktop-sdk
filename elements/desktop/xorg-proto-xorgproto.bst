kind: meson
description: X.Org combined protocol headers

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-meson.bst
  type: build
- filename: desktop/xorg-util-macros.bst
  type: build

sources:
- kind: git_tag
  url: freedesktop:xorg/proto/xorgproto.git
  track: master
  ref: xorgproto-2018.4-0-gbac7b0b421115448516da4b6214f07851dc7cdeb
