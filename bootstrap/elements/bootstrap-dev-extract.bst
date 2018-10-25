kind: script

depends:
- filename: bootstrap-dev.bst
  type: build

variables:
  install-root: '%{sysroot}'

config:
  layout:
  - element: bootstrap-dev.bst
    destination: /

public:
  bst:
    split-rules:
      devel:
      - /**
      runtime: []
      locale: []
      debug: []
      doc: []
