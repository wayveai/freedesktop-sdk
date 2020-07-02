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
  url: tar_https:download-mirror.savannah.gnu.org/releases/man-db/man-db-2.9.3.tar.xz
  ref: fa5aa11ab0692daf737e76947f45669225db310b2801a5911bceb7551c5597b8
