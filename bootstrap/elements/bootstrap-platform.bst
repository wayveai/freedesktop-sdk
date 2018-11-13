kind: compose

config:
  exclude:
  - devel

depends:
- filename: bootstrap.bst
  type: build
- filename: bootstrap-manifest.bst
  type: build
