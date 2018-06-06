kind: manual

depends:
  - filename: bootstrap-import.bst
    type: build

config:
  install-commands:
    - |
      mkdir -p "%{install-root}%{indep-libdir}/sdk"
      mkdir -p "%{install-root}%{debugdir}"
