kind: myautotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/nettle.bst
  - filename: base/libtasn1.bst
  - filename: base/libunistring.bst
  - filename: base/libidn2.bst
  - filename: base/p11-kit.bst
  - filename: base/pkg-config.bst
    type: build

public:
  bst:
    split-rules:
      devel:
        - "%{libdir}/libgnutls.so"
        - "%{libdir}/libgnutlsxx.so"

sources:
  - kind: tar
    url: ftp://ftp.gnutls.org/gcrypt/gnutls/v3.6/gnutls-3.6.1.tar.xz
    ref: 20b10d2c9994bc032824314714d0e84c0f19bdb3d715d8ed55beb7364a8ebaed
