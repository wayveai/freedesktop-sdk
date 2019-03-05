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
  track: release/2.28/master
  ref: glibc-2.28-60-g4d7af7815af5217db6e8fde6032ddf4f6b2a4420
- kind: local
  path: files/supported-locales.mk
