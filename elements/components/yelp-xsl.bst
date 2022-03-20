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
  ref: 42.0-0-g0346fc97eca8792e9a806d2537fbef7d1f98792b
