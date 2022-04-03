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
  exclude:
  - '*rc*'
  - '*beta*'
  - '*alpha'
  ref: 42.0-0-gdfa2d6ea142c73c20024cc3a3cefdaa4706268af
