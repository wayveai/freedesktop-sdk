kind: manual

depends:
- bootstrap-import.bst

runtime-depends:
- components/python3.bst

config:
  install-commands:
  - |
    install -D -t "%{install-root}%{bindir}" check-static-libraries.py
    install -D -t "%{install-root}%{datadir}" static_libraries_allow_list

sources:
- kind: local
  path: utils/check-static-libraries.py
- kind: local
  path: utils/static_libraries_allow_list
