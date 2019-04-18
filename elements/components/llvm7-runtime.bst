kind: filter
depends:
- filename: components/llvm7-base.bst
  type: build

config:
  exclude:
  - devel
  - static
  - doc
  include-orphans: True
