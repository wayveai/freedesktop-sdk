kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-poetry-core.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: tomlkit
  url: pypi:0f/96/ee6ba35c61186fbf084cb3077374d50eef36ab59cb8c6513317caa190935/tomlkit-0.8.0.tar.gz
  sha256sum: 29e84a855712dfe0e88a48f6d05c21118dbafb283bb2eed614d46f80deb8e9a1
