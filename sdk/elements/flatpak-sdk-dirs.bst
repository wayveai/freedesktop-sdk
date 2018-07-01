kind: manual

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: flatpak-basesdk-dirs.bst
    type: runtime

config:
  install-commands:
    - |
      mkdir -p "%{install-root}%{indep-libdir}/sdk"
