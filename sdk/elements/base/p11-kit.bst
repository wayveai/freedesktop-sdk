kind: myautotools

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/libtasn1.bst
  - filename: base/pkg-config.bst
    type: build

variables:
  conf-extra: |
    --with-trust-paths=/etc/ssl/certs/ca-certificates.crt

public:
  bst:
    split-rules:
      devel:
        - "%{libdir}/libp11-kit.so"

sources:
  - kind: tar
    url: https://github.com/p11-glue/p11-kit/releases/download/0.23.9/p11-kit-0.23.9.tar.gz
    ref: e1c1649c335107a8d33cf3762eb7f57b2d0681f0c7d8353627293a58d6b4db63

