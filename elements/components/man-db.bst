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
  url: tar_https:download-mirror.savannah.gnu.org/releases/man-db/man-db-2.10.2.tar.xz
  ref: ee97954d492a13731903c9d0727b9b01e5089edbd695f0cdb58d405a5af5514d
