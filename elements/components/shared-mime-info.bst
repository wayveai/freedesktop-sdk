kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/docbook-xsl.bst
- components/xmlto.bst

depends:
- components/libxml2.bst
- components/glib.bst

public:
  bst:
    integration-commands:
    - PKGSYSTEM_ENABLE_FSYNC=0 update-mime-database "%{datadir}/mime"

sources:
- kind: git_tag
  url: freedesktop:xdg/shared-mime-info.git
  track: master
  track-extra:
  - '2.0'
  ref: 2.1-0-g18e558fa1c8b90b86757ade09a4ba4d6a6cf8f70
- kind: patch
  path: patches/shared-mime-info/0001-migrate-from-custom-itstool-to-builtin-msgfmt-for-cr.patch
