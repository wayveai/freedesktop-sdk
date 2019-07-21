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
  ref: v3.7.2-0-g41ce399ce1a33fd7211754e77fb4a5ddcb1d9eea
