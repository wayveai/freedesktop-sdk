kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/libgcrypt.bst
  - filename: base/libassuan.bst
  - filename: base/libksba.bst
  - filename: base/npth.bst

sources:
  - kind: tar
    url: https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.8.tar.bz2
    ref: 777b4cb8ced21965a5053d4fa20fe11484f0a478f3d011cef508a1a49db50dcd
