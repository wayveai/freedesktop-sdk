kind: filter
depends:
- filename: cross-compilers/standard-libs-arm-compose.bst
  type: build

config:
  include:
  - arch
  include-orphans: False
