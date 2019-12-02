kind: compose

depends:
- filename: components/flatpak.bst
  type: build

config:
  exclude:
  - debug
