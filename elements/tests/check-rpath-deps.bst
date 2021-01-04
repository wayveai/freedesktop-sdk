kind: manual

depends:
- bootstrap-import.bst
- components/python3.bst
- components/python3-pyelftools.bst

config:
  install-commands:
  - |
    install -D -t "%{install-root}%{bindir}" find-rpath.py

sources:
- kind: local
  path: utils/find-rpath.py

