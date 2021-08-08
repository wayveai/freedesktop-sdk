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
  ref: 40.0-0-g00297c603474c28c757da82732e70e23dc6c0e2d
