kind: autotools

depends:
- filename: dependencies/base-sdk.bst
  type: build
- filename: gnu-config.bst
  type: build
- filename: tools-lib-path.bst
  type: runtime

(@): build.yml

variables:
  prefix: '%{tools}'
  lib: lib

sources:
- kind: tar
  url: ftp://ftp.astron.com/pub/file/file-5.35.tar.gz
  ref: 30c45e817440779be7aac523a905b123cba2a6ed0bf4f5439e1e99ba940b5546
