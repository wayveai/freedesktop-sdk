kind: compose

depends:
- filename: bootstrap-import.bst
  type: build

config:
  exclude:
  - debug
  - devel
  - docs
  - extra
  - static
  - vm-only
