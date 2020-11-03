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
  url: samba:rsync.git
  track: master
  ref: v3.2.3-0-ge94bad1c156fc3910f24e2b3b71a81b0b0bdeb70
  exclude:
  - '*pre*'
