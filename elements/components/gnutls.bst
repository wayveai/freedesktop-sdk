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
  url: tar_https:www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.13.tar.xz
  ref: 32041df447d9f4644570cf573c9f60358e865637d69b7e59d1159b7240b52f38
- kind: patch
  path: patches/gnutls/handle-addtrust-root-expiration.patch
