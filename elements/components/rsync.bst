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
  ref: v3.2.2-0-g194cee671d5e178f20c4494f41911fa8db942935
  exclude:
  - '*pre*'
