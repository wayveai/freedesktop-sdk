kind: autotools

depends:
- filename: dependencies/base-sdk.bst
  type: build
- filename: dependencies/config.bst
  type: build
- filename: tools-lib-path.bst
  type: runtime

variables:
  build-triplet: "$(sh /config/config.guess)"
  host-triplet: "$(sh /config/config.guess)"
  prefix: "%{tools}"
  lib: "lib"

sources:
  - kind: tar
    url: ftp://ftp.astron.com/pub/file/file-5.33.tar.gz
    ref: 1c52c8c3d271cd898d5511c36a68059cda94036111ab293f01f83c3525b737c6
