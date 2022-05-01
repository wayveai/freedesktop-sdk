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
  ref:
    sha256sum: e614fe7cd6ff096d2aea06733ecfb6b15411b2a0f4aef8267964a32c7f7472ac
    suffix: 8f/94/aa5be7907b9dd1733e4e7a1fa0bb737022d6fb13f80a9283520c66435f4d/asciidoc-10.1.4.tar.gz
