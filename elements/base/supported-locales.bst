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
- kind: tar
  url: ftp_gnu_org:glibc/glibc-2.27.tar.xz
  ref: 5172de54318ec0b7f2735e5a91d908afe1c9ca291fec16b5374d9faadfc1fc72
- kind: local
  path: files/supported-locales.mk
