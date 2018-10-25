kind: autotools

depends:
- filename: bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgpg-error.so'

sources:
- kind: tar
  url: https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.32.tar.bz2
  ref: c345c5e73cc2332f8d50db84a2280abfb1d8f6d4f1858b9daa30404db44540ca
