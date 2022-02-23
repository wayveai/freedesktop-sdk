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
  ref: 41.0-0-geb83ce4f0f282b3998e21798b4156536b25752b8
