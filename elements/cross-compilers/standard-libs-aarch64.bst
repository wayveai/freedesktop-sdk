kind: filter
depends:
- filename: cross-compilers/standard-libs-aarch64-compose.bst
  type: build

config:
  include:
  - arch
  include-orphans: False
