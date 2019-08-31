kind: autotools
description: pcre2

depends:
- filename: bootstrap-import.bst

variables:
  conf-local: |
    --enable-jit

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/pcre2-config'
        - '%{libdir}/libpcre2-8.so'
        - '%{libdir}/libpcre2-posix.so'

sources:
- kind: tar
  url: https://ftp.pcre.org/pub/pcre/pcre2-10.33.tar.bz2
  ref: 35514dff0ccdf02b55bd2e9fa586a1b9d01f62332c3356e379eabb75f789d8aa
