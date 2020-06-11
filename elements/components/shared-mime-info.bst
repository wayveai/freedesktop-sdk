kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/docbook-xsl.bst
- components/itstool.bst
- components/xmlto.bst

depends:
- components/libxml2.bst
- components/glib.bst

public:
  bst:
    integration-commands:
    - update-mime-database "%{datadir}/mime"

sources:
- kind: git_tag
  url: freedesktop:xdg/shared-mime-info.git
  track: master
  track-extra:
  - '2.0'
  ref: 2.0-0-gef58b2b2f7ad4070171c6e45e3b3764daa3ff2c1
