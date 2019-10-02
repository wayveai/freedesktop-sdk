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
  ref: 3.34.0-0-gdef23391ba926c4038c82c24b50976c5a7e1713b
