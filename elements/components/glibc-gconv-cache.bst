kind: manual

depends:
- bootstrap-import.bst

config:
  build-commands:
  - iconvconfig --output=gconv-modules.cache

  install-commands:
  - install -Dm644 -t '%{install-root}%{libdir}/gconv' gconv-modules.cache
