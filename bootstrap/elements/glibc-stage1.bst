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
- kind: git_tag
  url: https://sourceware.org/git/glibc.git
  track: master
  ref: glibc-2.27-0-g23158b08a0908f381459f273a984c6fd328363cb
- kind: patch
  path: patches/glibc-reorder-end.patch
