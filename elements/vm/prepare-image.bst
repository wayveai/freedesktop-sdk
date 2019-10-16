kind: manual

build-depends:
- bootstrap-import.bst

config:
  install-commands:
  - |
    install -Dm 755 -t "%{install-root}%{bindir}" prepare-image.sh

sources:
- kind: local
  path: files/vm/prepare-image.sh
