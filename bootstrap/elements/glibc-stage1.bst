kind: autotools

depends:
- filename: dependencies/base-sdk.bst
  type: build
- filename: gnu-config.bst
  type: build

(@): build.yml

variables:
  prefix: /glibc
  lib: lib

sources:
- kind: git_tag
  url: sourceware:glibc.git
  track: master
  ref: glibc-2.27-0-g23158b08a0908f381459f273a984c6fd328363cb
- kind: patch
  path: patches/glibc-reorder-end.patch
