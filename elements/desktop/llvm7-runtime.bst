kind: filter
depends:
- filename: desktop/llvm7.bst
  type: build

config:
  exclude:
  - devel
  - doc
  include-orphans: True
