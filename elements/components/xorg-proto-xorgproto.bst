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
  track: master
  ref: xorgproto-2021.4-0-geec0adee25847de29ab1a41bba530612451361a5
