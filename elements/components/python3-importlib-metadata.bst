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
  url: pypi:1c/7f/fe573d2225d7e0ea4bd9e8673b2c7fc0b2b2b2f86b36f8c5fe75b77e59c4/importlib_metadata-4.5.0.tar.gz
  sha256sum: b142cc1dd1342f31ff04bb7d022492b09920cb64fed867cd3ea6f80fe3ebd139
