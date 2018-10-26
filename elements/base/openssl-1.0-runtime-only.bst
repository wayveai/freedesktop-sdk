kind: filter

depends:
- filename: base/openssl-1.0.bst
  type: build

config:
  include:
  - runtime

  exclude:
  - devel
