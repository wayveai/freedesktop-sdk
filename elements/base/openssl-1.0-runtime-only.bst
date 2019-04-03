kind: filter

depends:
- filename: base/openssl-1.0.bst
  type: build

public:
  cpe:
    version: 1.0.2r
    vendor: openssl
    product: openssl

config:
  include:
  - runtime

  exclude:
  - devel
