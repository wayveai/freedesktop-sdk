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
  url: freedesktop:xorg/proto/xorgproto
  track: master
  ref: af9b5f43439378efd1e12d11d487a71f42790fec     # xorgproto-2018.4
