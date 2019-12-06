kind: autotools
description: pcre

depends:
- filename: bootstrap-import.bst

variables:
  conf-local: |
    --enable-unicode-properties

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpcre.so'
        - '%{libdir}/libpcrecpp.so'
        - '%{libdir}/libpcreposix.so'

sources:
- kind: tar
  url: tar_https:ftp.pcre.org/pub/pcre/pcre-8.42.tar.bz2
  ref: 2cd04b7c887808be030254e8d77de11d3fe9d4505c39d4b15d2664ffe8bf9301
