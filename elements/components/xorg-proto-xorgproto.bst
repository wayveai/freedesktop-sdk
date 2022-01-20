kind: meson
description: X.Org combined protocol headers

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

sources:
- kind: git_tag
  url: freedesktop:xorg/proto/xorgproto.git
  # Tracking disabled due to ABI issues
  ref: xorgproto-2020.1-0-gc62e8203402cafafa5ba0357b6d1c019156c9f36
