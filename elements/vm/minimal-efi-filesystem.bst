kind: compose

build-depends:
- vm/minimal-efi-deps.bst

config:
  exclude:
  - debug
  - devel
  include-orphans: True
