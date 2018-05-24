kind: compose

config:
  include:
    - devel
  include-orphans: False

depends:
- filename: bootstrap.bst
  type: build
