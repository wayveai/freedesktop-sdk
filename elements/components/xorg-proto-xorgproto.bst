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
  exclude:
  - xorgproto-*.*.99.*
  ref: xorgproto-2021.5-0-g57acac1d4c7967f4661fb1c9f86f48f34a46c48d
