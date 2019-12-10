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

# FIXME: This can be removed for 3.6.10
  builddir: ''

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
  url: tar_https:www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.9.tar.xz
  ref: 4331fca55817ecdd74450b908a6c29b4f05bb24dd13144c6284aa34d872e1fcb
