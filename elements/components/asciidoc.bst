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
  ref: 618f6e6f6b558ed1e5f2588cd60a5a6b4f881ca0
