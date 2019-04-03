kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/gettext.bst
  type: build
- filename: base/libtasn1.bst
- filename: base/libunistring.bst
- filename: base/libidn2.bst
- filename: base/nettle.bst
- filename: base/p11-kit.bst

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
  url: https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.6.tar.xz
  ref: bb9acab8af2ac430edf45faaaa4ed2c51f86e57cb57689be6701aceef4732ca7
