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
  url: https://sourceware.org/git/glibc.git
  track: master
  ref: glibc-2.27-0-g23158b08a0908f381459f273a984c6fd328363cb
- kind: local
  path: files/supported-locales.mk
