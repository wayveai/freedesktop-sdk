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
  url: tar_https:www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.14.tar.xz
  ref: 5630751adec7025b8ef955af4d141d00d252a985769f51b4059e5affa3d39d63
