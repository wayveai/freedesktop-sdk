kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-poetry-core.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: tomlkit
  url: pypi:3c/9b/62c6f4e28152a9473d3ecceef627deaa32bec23f9666a5ed4efa6067380f/tomlkit-0.9.2.tar.gz
  sha256sum: ebd982d61446af95a1e082b103e250cb9e6d152eae2581d4a07d31a70b34ab0f
