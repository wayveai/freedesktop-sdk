kind: filter
depends:
- filename: cross-compilers/standard-libs-i686-compose.bst
  type: build

config:
  include:
  - arch
  include-orphans: False
