kind: autotools

depends:
- filename: dependencies/base-sdk.bst
  type: build
- filename: gnu-config.bst
  type: build

variables:
  prefix: /glibc
  lib: lib
  build-triplet: '%{guessed-triplet}'
  host-triplet: '%{guessed-triplet}'

environment:
  CPPFLAGS: ''
  CFLAGS: -O2 -g
  CXXFLAGS: -O2 -g
  LDFLAGS: ''

sources:
- kind: tar
  url: ftp_gnu_org:glibc/glibc-2.27.tar.xz
  ref: 5172de54318ec0b7f2735e5a91d908afe1c9ca291fec16b5374d9faadfc1fc72
- kind: patch
  path: patches/glibc-reorder-end.patch
