kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/doxygen.bst

depends:
- components/libgcrypt.bst
- components/json-c.bst
- components/curl.bst
- components/openssl.bst

sources:
- kind: git_tag
  url: github:tpm2-software/tpm2-tss.git
  track: master
  track-extra:
  - 2.4.x
  exclude:
  - '*rc*'
  ref: 2.4.1-0-g703a16f288bc1119a07425d36e80a3004cbe5210
