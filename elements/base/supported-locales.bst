kind: manual

depends:
- filename: bootstrap-import.bst

config:
  build-commands:
  - |
    make -f supported-locales.mk SUPPORTED

  install-commands:
  - |
    install -D -m0644 SUPPORTED "%{install-root}%{datadir}/i18n/SUPPORTED"

sources:
- kind: git_tag
  url: sourceware:glibc.git
  track: release/2.27/master
  ref: 2.27-99-gf6d0e8c36f02b387d33f2cc58c7cb204f201d92e
- kind: local
  path: files/supported-locales.mk
