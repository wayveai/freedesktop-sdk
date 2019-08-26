kind: filter
depends:
- filename: components/llvm-base.bst
  type: build

config:
  exclude:
  - devel
  - static-blocklist
  - doc
  include-orphans: True
