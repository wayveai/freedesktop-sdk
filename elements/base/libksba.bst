kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/libgpg-error.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libksba.so'

sources:
- kind: tar
  url: https://www.gnupg.org/ftp/gcrypt/libksba/libksba-1.3.5.tar.bz2
  ref: 41444fd7a6ff73a79ad9728f985e71c9ba8cd3e5e53358e70d5f066d35c1a340
