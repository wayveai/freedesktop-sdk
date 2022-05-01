kind: pip

build-depends:
- components/python3-pip.bst

runtime-depends:
- components/docbook-xsl.bst
- components/libxslt.bst

depends:
- bootstrap-import.bst
- components/python3.bst

sources:
- kind: pypi
  name: asciidoc
