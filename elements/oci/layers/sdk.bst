kind: compose

depends:
- filename: sdk.bst
  type: build
- filename: linker-debuginfo.bst
  type: build

config:
  exclude:
  - debug
  - docs
  - extra
  - static
  - vm-only
