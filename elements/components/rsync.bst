kind: autotools

depends:
- bootstrap-import.bst
- components/lz4.bst
- components/openssl.bst

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/git-minimal.bst

variables:
  builddir: ''
  conf-local: >-
    --without-included-zlib
    --disable-xxhash
    --disable-zstd
    --disable-simd
    --disable-md2man

sources:
- kind: git_tag
  url: samba:rsync.git
  track: master
  ref: v3.2.4-0-g0ac7ebceef70417355f25daf9e2fd94e84c49749
  exclude:
  - '*pre*'
