kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-poetry-core.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: tomlkit
  url: pypi:60/cd/21a4dd7545350968e544f785e6be4273e6b58cc40a1ab1010d3ce573bc5a/tomlkit-0.10.1.tar.gz
  sha256sum: 3c517894eadef53e9072d343d37e4427b8f0b6200a70b7c9a19b2ebd1f53b951
