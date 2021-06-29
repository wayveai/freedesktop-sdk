kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: importlib-resources
  url: pypi:ac/94/30b82b3a3a7c4f7fd7be1082047cc9a135a10c1bcb0158a2aec20d8fec57/importlib_resources-5.2.0.tar.gz
  sha256sum: 22a2c42d8c6a1d30aa8a0e1f57293725bfd5c013d562585e46aff469e0ff78b3
