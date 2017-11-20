kind: mycompose

config:
  exclude:
    - devel

depends:
- filename: bootstrap-import-platform.bst
  type: build
- filename: just-base-platform.bst
  type: build
- filename: just-desktop-platform.bst
  type: build
