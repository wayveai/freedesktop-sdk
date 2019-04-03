kind: filter
depends:
- filename: desktop/llvm7-base.bst
  type: build

config:
  exclude:
  - devel
  - static
  - doc
  include-orphans: True
