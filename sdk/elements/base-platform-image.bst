kind: compose

config:
  exclude:
    - devel

depends:
- filename: bootstrap-import-platform.bst
  type: build
- filename: just-base-platform.bst
  type: build
