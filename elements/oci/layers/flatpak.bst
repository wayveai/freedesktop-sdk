kind: compose

build-depends:
- filename: sdk.bst
- filename: components/flatpak.bst
- filename: components/flat-manager-client.bst

config:
  exclude:
  - debug
  - docs
  - extra
  - static-blocklist
  - vm-only
