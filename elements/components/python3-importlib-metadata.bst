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
  url: pypi:aa/b9/514816064db3028d7370f2ce02e8e8f5d9bc68f6f9a41b04d19176aba70e/importlib_metadata-4.6.4.tar.gz
  sha256sum: 7b30a78db2922d78a6f47fb30683156a14f3c6aa5cc23f77cc8967e9ab2d002f
