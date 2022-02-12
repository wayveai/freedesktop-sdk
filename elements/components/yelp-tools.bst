kind: meson

build-depends:
- components/itstool.bst
- components/libxml2.bst
- components/libxslt.bst
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst
- components/python3-lxml.bst
- components/yelp-xsl.bst

sources:
- kind: git_tag
  url: gnome:yelp-tools.git
  track: master
  ref: 41.0-0-g6a68991ff8fe7dc1f97dd8479fc44316f0ded89b
