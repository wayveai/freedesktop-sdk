kind: compose

depends:
- filename: sdk.bst
  type: build

config:
  exclude:
  - debug
  - docs
  - extra
  - static
  - vm-only
