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
        - '%{libdir}/libpcre2-8.so'
        - '%{libdir}/libpcre2-posix.so'

sources:
- kind: tar
  url: tar_https:ftp.pcre.org/pub/pcre/pcre2-10.31.tar.bz2
  ref: e07d538704aa65e477b6a392b32ff9fc5edf75ab9a40ddfc876186c4ff4d68ac
