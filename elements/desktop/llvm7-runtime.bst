kind: filter
depends:
- filename: desktop/llvm7-base.bst
  type: build

config:
  exclude:
  - devel
  - doc
  include-orphans: True
