kind: compose

depends:
- filename: deploy-tools/flatpak.bst
  type: build

config:
  exclude:
  - debug
