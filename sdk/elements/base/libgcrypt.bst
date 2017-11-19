kind: myautotools

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/libgpg-error.bst

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libgcrypt.so"

sources:
  - kind: tar
    url: https://www.gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.8.1.tar.bz2
    ref: 7a2875f8b1ae0301732e878c0cca2c9664ff09ef71408f085c50e332656a78b3
