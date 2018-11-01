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
  # -D_FORTIFY_SOURCE=2 breaks building glibc
  common_flags: "-O2 -g -pipe -Wp,-D_GLIBCXX_ASSERTIONS -fexceptions -fstack-protector-strong -grecord-gcc-switches"

sources:
- kind: tar
  url: ftp_gnu_org:glibc/glibc-2.27.tar.xz
  ref: 5172de54318ec0b7f2735e5a91d908afe1c9ca291fec16b5374d9faadfc1fc72
- kind: patch
  path: patches/glibc-reorder-end.patch
