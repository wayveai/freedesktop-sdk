kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/libtasn1.bst
- components/libunistring.bst
- components/libidn2.bst
- components/nettle.bst
- components/p11-kit.bst

variables:

  conf-local: >-
    --disable-doc
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
  url: tar_https:www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.2.tar.xz
  ref: 646e6c5a9a185faa4cea796d378a1ba8e1148dbb197ca6605f95986a25af2752
- kind: patch
  path: patches/gnutls/0001-Revert-gnutlsxx-add-const-and-explicit-specifiers-wh.patch
