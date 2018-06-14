kind: manual

depends:
  - filename: bootstrap-import.bst
    type: build

public:
  bst:
    split-rules:
      debug: []

config:
  install-commands:
    - |
      mkdir -p "%{install-root}%{debugdir}"
