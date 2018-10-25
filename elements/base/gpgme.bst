kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/libgpg-error.bst
- filename: base/libassuan.bst
- filename: base/gnupg.bst
  type: build

variables:
  conf-local: |
    --disable-glibtest     \
    --disable-gpgconf-test \
    --disable-gpg-test     \
    --disable-gpgsm-test   \
    --disable-g13-test

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgpgme.so'
        - '%{libdir}/libgpgmepp.so'

sources:
- kind: tar
  url: https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-1.11.1.tar.bz2
  ref: 2d1b111774d2e3dd26dcd7c251819ce4ef774ec5e566251eb9308fa7542fbd6f
