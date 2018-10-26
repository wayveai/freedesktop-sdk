kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/libgcrypt.bst
- filename: base/libassuan.bst
- filename: base/libksba.bst
- filename: base/npth.bst

sources:
- kind: tar
  url: https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.9.tar.bz2
  ref: 6278eaabffa1ebc9fa2ceb3dc53eea9a1505ab02a668a86dd6fec06951af2164
