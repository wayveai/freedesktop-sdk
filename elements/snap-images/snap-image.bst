kind: compose

config:
  exclude:
  - devel
  - extra
  - static

depends:
- filename: platform.bst
  type: build
- filename: snap-images/dash.bst
  type: build
