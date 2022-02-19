kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/itstool.bst
  type: build

sources:
- kind: git_tag
  url: gnome:yelp-xsl.git
  track: master
  exclude:
  - '*rc*'
  - '*beta*'
  - '*alpha*'
  ref: 40.2-0-g023d87ef9f8c6fb305d45b5151b367dc803bd441
