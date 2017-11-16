kind: mycompose

config:
  exclude:
    - devel

depends:
- filename: bootstrap-import-platform.bst
  type: build
- filename: just-base.bst
  type: build
- filename: just-desktop.bst
  type: build
