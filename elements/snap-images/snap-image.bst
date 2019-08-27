kind: compose

config:
  exclude:
  - devel
  - extra
  - vm-only

depends:
- filename: platform.bst
  type: build
- filename: snap-images/dash.bst
  type: build
