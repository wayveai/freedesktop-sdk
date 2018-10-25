kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/libgpg-error.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgcrypt.so'

sources:
- kind: tar
  url: https://www.gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.8.3.tar.bz2
  ref: 66ec90be036747602f2b48f98312361a9180c97c68a690a5f376fa0f67d0af7c
