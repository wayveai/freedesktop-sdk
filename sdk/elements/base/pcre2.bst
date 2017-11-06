kind: myautotools
description: pcre2

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/diffutils.bst
    type: build
  - filename: base/file.bst
    type: build

public:
  bst:
    split-rules:
      devel:
        - "%{libdir}/libpcre2-8.so"
        - "%{libdir}/libpcre2-posix.so"

sources:
  - kind: tar
    url: https://ftp.pcre.org/pub/pcre/pcre2-10.30.tar.bz2
    ref: 90bd41c605d30e3745771eb81928d779f158081a51b2f314bbcc1f73de5773db
