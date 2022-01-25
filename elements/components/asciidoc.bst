kind: pip

build-depends:
- components/python3-pip.bst

depends:
- bootstrap-import.bst
- components/python3.bst

sources:
- kind: pypi
  name: asciidoc
  url: pypi:4b/c0/ded4666a6d7a978b50fda85f44ba7f0939bd92838102769eca91a769aa9f/asciidoc-10.1.1.tar.gz
  sha256sum: 33ac648f7b38fa8712cfdbbfd2465a263fea2dcd106946fcf7d59ae6473b47c5
