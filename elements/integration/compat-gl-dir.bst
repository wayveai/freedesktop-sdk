kind: manual
description: Creates a GL subdirectory, needed for the GL32 compat extension

depends:
- filename: bootstrap-import.bst
  type: build

config:
  install-commands:
  - |
    mkdir -p "%{install-root}%{libdir}/GL"
