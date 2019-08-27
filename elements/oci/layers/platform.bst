kind: compose

depends:
- filename: platform.bst
  type: build

config:
  exclude:
  - debug
  - devel
  - docs
  - extra
  - vm-only
