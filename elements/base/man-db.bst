kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/less.bst
- filename: base/groff.bst
- filename: base/libpipeline.bst
- filename: base/gzip.bst
- filename: base/xz.bst
- filename: base/lzip.bst

variables:
  conf-local: |
    --disable-cache-owner

sources:
- kind: tar
  url: tar_https:download-mirror.savannah.gnu.org/releases/man-db/man-db-2.8.3.tar.xz
  ref: 5932a1ca366e1ec61a3ece1a3afa0e92f2fdc125b61d236f20cc6ff9d80cc4ac
