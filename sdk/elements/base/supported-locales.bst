kind: manual

depends:
  - filename: bootstrap-import.bst
    type: build

config:
  build-commands:
    - |
      make -f supported-locales.mk SUPPORTED

  install-commands:
    - |
      install -D -m0644 SUPPORTED "%{install-root}%{datadir}/i18n/SUPPORTED"

sources:
- kind: tar
  url: http://ftp.gnu.org/gnu/glibc/glibc-2.26.tar.xz
  ref: e54e0a934cd2bc94429be79da5e9385898d2306b9eaf3c92d5a77af96190f6bd
- kind: local
  path: elements/base/supported-locales.mk
