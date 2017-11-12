kind: myautotools

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/libgcrypt.bst
  - filename: base/libassuan.bst
  - filename: base/libksba.bst
  - filename: base/npth.bst

public:
  bst:
    split-rules:
      devel:
        - "%{libdir}/libnpth.so"

sources:
  - kind: tar
    url: https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.2.tar.bz2
    ref: bfb62c7412ceb3b9422c6c7134a34ff01a560f98eb981c2d96829c1517c08197
