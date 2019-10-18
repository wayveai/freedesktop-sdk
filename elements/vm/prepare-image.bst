kind: manual

depends:
- bootstrap-import.bst

runtime-depends:
- components/systemd.bst
- components/tzdata.bst

config:
  install-commands:
  - |
    install -Dm 755 -t "%{install-root}%{bindir}" prepare-image.sh

sources:
- kind: local
  path: files/vm/prepare-image.sh
