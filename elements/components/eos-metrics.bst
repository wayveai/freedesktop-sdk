kind: autotools

build-depends:
- components/gtk-doc.bst
- components/python3-dbusmock.bst
- components/yelp-tools.bst
- public-stacks/buildsystem-autotools.bst

depends:
- filename: bootstrap-import.bst
- filename: components/gobject-introspection.bst

variables:
  conf-local: >-
    --disable-gir-doc

sources:
- kind: git_tag
  url: github:endlessm/eos-metrics.git
  track: master
  track-extra:
  - eos4.0
  exclude:
  - Release_3.*
  ref: Release_4.0.3-0-gb9b99b04ac76643943fd603416de9e0bf08db5bb
