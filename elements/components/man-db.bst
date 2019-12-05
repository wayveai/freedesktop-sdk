kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/less.bst
- filename: components/groff.bst
- filename: components/libpipeline.bst
- filename: components/gzip.bst
- filename: components/xz.bst
- filename: components/lzip.bst
- filename: components/util-linux.bst
- filename: components/flex.bst
  type: build

variables:
  conf-local: |
    --disable-cache-owner \
    --with-systemdsystemunitdir=%{prefix}/lib/systemd

public:
  bst:
    split-rules:
      (@): include/_private/exclude-systemd.yml

sources:
- kind: tar
  url: tar_https:download-mirror.savannah.gnu.org/releases/man-db/man-db-2.8.5.tar.xz
  ref: b64d52747534f1fe873b2876eb7f01319985309d5d7da319d2bc52ba1e73f6c1
