kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/gperf.bst
  type: build
- filename: components/docbook-xml.bst
  type: build
- filename: components/docbook-xsl.bst
  type: build
- filename: components/asciidoc.bst
  type: build
- filename: components/libxslt.bst
  type: build

sources:
- kind: git_tag
  url: github:ccache/ccache.git
  track: master
  track-extra:
  - 3.7-maint
  ref: v3.7.11-0-g4293f48b6670a99eaa1d5701718d8ef3f2ddd70d
