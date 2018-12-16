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
  url: https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.4.tar.xz
  ref: c663a792fbc84349c27c36059181f2ca86c9442e75ee8b0ad72f5f9b35deab3a
- kind: patch
  path: patches/gnutls-priority_set-do-not-override-the-version-afte.patch
