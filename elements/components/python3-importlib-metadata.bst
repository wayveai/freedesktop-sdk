kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

depends:
- components/python3.bst
- components/python3-zipp.bst

sources:
- kind: pypi
  name: importlib-metadata
  url: pypi:a7/08/c5f2e6193c12ceb5b5048d579e8f1f82c9957b57427da808c15b44479dec/importlib_metadata-4.6.1.tar.gz
  sha256sum: 079ada16b7fc30dfbb5d13399a5113110dab1aa7c2bc62f66af75f0b717c8cac
