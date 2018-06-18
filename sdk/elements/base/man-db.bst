kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/less.bst
  - filename: base/groff.bst
  - filename: base/pkg-config.bst
    type: build
  - filename: base/libpipeline.bst
  - filename: base/gzip.bst
  - filename: base/bzip2.bst
  - filename: base/xz.bst
  - filename: base/lzip.bst

variables:
  conf-local: |
    --disable-cache-owner

sources:
  - kind: tar
    url: https://download.savannah.nongnu.org/releases/man-db/man-db-2.7.6.1.tar.xz
    ref: 08edbc52f24aca3eebac429b5444efd48b9b90b9b84ca0ed5507e5c13ed10f3f
