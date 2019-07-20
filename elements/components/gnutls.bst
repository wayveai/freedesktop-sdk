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
  url: https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.8.tar.xz
  ref: aa81944e5635de981171772857e72be231a7e0f559ae0292d2737de475383e83
