kind: autotools

depends:
  - filename: bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libgpg-error.so"

sources:
  - kind: tar
    url: https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.31.tar.bz2
    ref: 40d0a823c9329478063903192a1f82496083b277265904878f4bc09e0db7a4ef
