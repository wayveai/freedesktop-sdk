kind: autotools

depends:
- bootstrap-import.bst
- components/lz4.bst

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
  url: gitlab:freedesktop-sdk/mirrors/samba/rsync.git
  track: master
  ref: v3.2.0-0-gc225330aaf9d6032a79317bda1bf669e90ac7212
  exclude:
  - '*pre*'
