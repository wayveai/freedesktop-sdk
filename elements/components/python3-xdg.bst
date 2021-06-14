kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-poetry.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: xdg
  url: pypi:b0/f1/194be3c59f4224c42477d2e593c02c61961d305869fcea47fbc9d17ac67f/xdg-5.1.0.tar.gz
  sha256sum: 3949564ca3c204e7a7fa72d85f55fb436c0e6108506e3eb61f3f4cf5be35deca
