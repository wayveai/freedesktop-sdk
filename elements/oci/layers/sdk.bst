kind: compose

depends:
- filename: sdk.bst
  type: build

config:
  exclude:
  - debug
  - doc
  - locale
  - extra
  - static-blocklist
  - vm-only
