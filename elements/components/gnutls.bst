kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/libtasn1.bst
- filename: components/libunistring.bst
- filename: components/libidn2.bst
- filename: components/nettle.bst
- filename: components/p11-kit.bst

variables:

  conf-local: |
    --disable-doc \
    --with-default-trust-store-pkcs11="pkcs11:"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgnutls.so'
        - '%{libdir}/libgnutlsxx.so'

sources:
- kind: tar
  url: tar_https:www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.16.tar.xz
  ref: 1b79b381ac283d8b054368b335c408fedcb9b7144e0c07f531e3537d4328f3b3
