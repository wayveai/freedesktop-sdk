kind: script

depends:
- filename: bootstrap-platform.bst
  type: build

variables:
  install-root: '%{sysroot}'

config:
  layout:
  - element: bootstrap-platform.bst
    destination: /

public:
  bst:
    split-rules:
      devel: []
