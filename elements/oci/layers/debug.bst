kind: compose

depends:
- filename: sdk.bst
  type: build

config:
  exclude:
  - docs
  - extra
  - static-blocklist
  - vm-only
