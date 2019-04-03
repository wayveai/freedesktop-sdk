kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/docbook-xml.bst
  type: build
- filename: base/docbook-xsl.bst
  type: build
- filename: base/libxslt.bst
  type: build
- filename: base/python3.bst

variables:
  builddir: ''

sources:
- kind: git
  url: github:asciidoc/asciidoc-py3.git
  track: master
  ref: 618f6e6f6b558ed1e5f2588cd60a5a6b4f881ca0
