kind: manual

depends:
- bootstrap-import.bst

config:
  install-commands:
  - |
    install -D -t "%{install-root}%{bindir}" find-rpath.sh

sources:
- kind: local
  path: utils/find-rpath.sh

