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
  url: pypi:30/8c/aafe43247cd18441740a4c3976c29b147e9df3ce79c1076b4e4f6253d15d/importlib_metadata-3.3.0.tar.gz
  sha256sum: 5c5a2720817414a6c41f0a49993908068243ae02c1635a228126519b509c8aed
