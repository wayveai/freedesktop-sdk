kind: myautotools

depends:
  - filename: bootstrap-import.bst
    type: build

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libnpth.so"

sources:
  - kind: tar
    url: https://www.gnupg.org/ftp/gcrypt/npth/npth-1.5.tar.bz2
    ref: 294a690c1f537b92ed829d867bee537e46be93fbd60b16c04630fbbfcd9db3c2
