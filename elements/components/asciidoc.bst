kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/docbook-xml.bst
  type: build
- filename: components/docbook-xsl.bst
  type: build
- filename: components/libxslt.bst
  type: build
- filename: components/python3.bst

variables:
  builddir: ''

sources:
- kind: git
  url: github:asciidoc/asciidoc-py3.git
  track: master
  ref: 5b8771e2497ebfc70c93756d2afe9cd6f6c73641
