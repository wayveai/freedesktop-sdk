kind: compose

config:
  exclude:
  - extra
  - vm-only

build-depends:
- sdk.bst
- components/os-release.bst
- vm/mesa-default.bst
