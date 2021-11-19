kind: manual
description: Creates a GL subdirectory, needed for the GL32 compat extension

build-depends:
- bootstrap-import.bst

config:
  install-commands:
  - |
    mkdir -p "%{install-root}%{libdir}/GL"
