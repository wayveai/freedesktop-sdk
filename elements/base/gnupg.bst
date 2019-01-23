kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/libgcrypt.bst
- filename: base/libassuan.bst
- filename: base/libksba.bst
- filename: base/npth.bst

sources:
- kind: tar
  url: https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.12.tar.bz2
  ref: db030f8b4c98640e91300d36d516f1f4f8fe09514a94ea9fc7411ee1a34082cb
