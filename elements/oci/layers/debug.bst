kind: compose

depends:
- filename: sdk.bst
  type: build

config:
  exclude:
  - doc
  - locale
  - extra
  - static-blocklist
  - vm-only
