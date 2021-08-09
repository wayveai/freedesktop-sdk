kind: autotools

build-depends:
- components/gtk-doc.bst
- components/python3-dbusmock.bst
- components/yelp-tools.bst
- public-stacks/buildsystem-autotools.bst

depends:
- filename: bootstrap-import.bst
- filename: components/gobject-introspection.bst

sources:
- kind: git_tag
  url: github:endlessm/eos-metrics.git
  track: master
  track-extra:
  - eos3.6
  - eos3.7
  - eos3.8
  - eos3.9
  ref: Release_3.9.5-0-gb9b99b04ac76643943fd603416de9e0bf08db5bb
