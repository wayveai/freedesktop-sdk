kind: compose

build-depends:
- vm/minimal/deps.bst

config:
  exclude:
  - debug
  - devel
  include-orphans: True
