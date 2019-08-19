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
  ref: v3.7.3-0-gfc69e8243743a2ed9305ff58c00e4fb23cb55237
