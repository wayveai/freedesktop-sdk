kind: autotools

depends:
  - filename: base/nettle.bst
  - filename: base/libtasn1.bst
  - filename: base/libunistring.bst
  - filename: base/libidn2.bst
  - filename: base/p11-kit.bst
  - filename: base/pkg-config.bst
    type: build

variables:
  conf-local: |
    --with-default-trust-store-file=/etc/ssl/certs/ca-certificates.crt

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libgnutls.so"
          - "%{libdir}/libgnutlsxx.so"

sources:
  - kind: tar
    url: https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.2.tar.xz
    ref: bcd5db7b234e02267f36b5d13cf5214baac232b7056a506252b7574ea7738d1f
