kind: autotools

depends:
- filename: dependencies/base-sdk.bst
  type: build
- filename: gnu-config.bst
  type: build
- filename: tools-lib-path.bst
  type: runtime

variables:
  build-triplet: '%{guessed-triplet}'
  host-triplet: '%{guessed-triplet}'
  prefix: '%{tools}'
  lib: lib

sources:
- kind: tar
  url: ftp://ftp.astron.com/pub/file/file-5.33.tar.gz
  ref: 1c52c8c3d271cd898d5511c36a68059cda94036111ab293f01f83c3525b737c6
