kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst

sources:
- kind: pypi
  name: urllib3
  url: pypi:94/40/c396b5b212533716949a4d295f91a4c100d51ba95ea9e2d96b6b0517e5a5/urllib3-1.26.5.tar.gz
  sha256sum: a7acd0977125325f516bda9735fa7142b909a8d01e8b2e4c8108d0984e6e0098
