kind: compose

config:
  exclude:
    - devel

depends:
- filename: desktop-platform.bst
  type: build
- filename: snap-images/dash.bst
  type: build
