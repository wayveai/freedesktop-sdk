kind: compose

config:
  exclude:
    - devel

depends:
- filename: platform.bst
  type: build
- filename: snap-images/dash.bst
  type: build
