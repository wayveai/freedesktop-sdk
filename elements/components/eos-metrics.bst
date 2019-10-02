kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/gtk-doc.bst
  type: build
- filename: components/gobject-introspection.bst

- filename: components/yelp-tools.bst
  type: build
- filename: components/python3-dbusmock.bst
  type: build

sources:
- kind: git_tag
  url: github:endlessm/eos-metrics.git
  track: master
  track-extra:
  - eos3.6
  - eos3.7
  ref: Release_3.6.4-0-gab66c7319c573999740f636555b14b6f658e82c0
