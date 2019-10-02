kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/libxml2.bst
  type: build
- filename: components/libxslt.bst
  type: build
- filename: components/itstools.bst
  type: build

- filename: components/yelp-xsl.bst

sources:
- kind: git_tag
  url: gnome:yelp-tools.git
  track: master
  ref: 3.32.2-0-gc8664c3df853f5307ff3c4d939721f340d61f4ba
