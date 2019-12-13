kind: compose

depends:
- filename: platform.bst
  type: build

config:
  exclude:
  - debug
  - devel
  - doc
  - locale
  - extra
  - vm-only
