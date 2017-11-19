kind: myautotools
description: pcre

depends:
  - filename: bootstrap-import.bst
    type: build

variables:
  conf-extra: |
    --enable-unicode-properties

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libpcre.so"
          - "%{libdir}/libpcrecpp.so"
          - "%{libdir}/libpcreposix.so"

sources:
  - kind: tar
    url: https://ftp.pcre.org/pub/pcre/pcre-8.41.tar.bz2
    ref: e62c7eac5ae7c0e7286db61ff82912e1c0b7a0c13706616e94a7dd729321b530
