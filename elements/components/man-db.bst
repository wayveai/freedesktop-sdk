kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/flex.bst
- components/systemd.bst

depends:
- bootstrap-import.bst
- components/less.bst
- components/groff.bst
- components/libpipeline.bst
- components/gzip.bst
- components/lzip.bst
- components/util-linux.bst

variables:
  conf-local: >-
    --disable-cache-owner

public:
  bst:
    split-rules:
      (@): include/_private/exclude-systemd.yml

sources:
- kind: tar
  url: tar_https:download-mirror.savannah.gnu.org/releases/man-db/man-db-2.9.3.tar.xz
  ref: fa5aa11ab0692daf737e76947f45669225db310b2801a5911bceb7551c5597b8
