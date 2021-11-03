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
  url: pypi:4d/34/523195b783e799fd401ad4bbc40d787926dd4c61838441df08bf42297792/packaging-21.2.tar.gz
  sha256sum: 096d689d78ca690e4cd8a89568ba06d07ca097e3306a4381635073ca91479966
