kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-pyparsing.bst

sources:
- kind: pypi
  name: packaging
  url: pypi:86/3c/bcd09ec5df7123abcf695009221a52f90438d877a2f1499453c6938f5728/packaging-20.9.tar.gz
  sha256sum: 5b327ac1320dc863dca72f4514ecc086f31186744b84a230374cc1fd776feae5
