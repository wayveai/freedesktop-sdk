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
  url: pypi:3e/1d/964b27278cfa369fbe9041f604ab09c6e99556f8b7910781b4584b428c2f/importlib_metadata-4.11.3.tar.gz
  sha256sum: ea4c597ebf37142f827b8f39299579e31685c31d3a438b59f469406afd0f2539
