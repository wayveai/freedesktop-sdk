kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: importlib-resources
  url: pypi:07/3c/4e27ef7d4cea5203ed4b52b7fe96ddd08559d9f147a2a4307e7d6d98c035/importlib_resources-5.7.1.tar.gz
  sha256sum: b6062987dfc51f0fcb809187cffbd60f35df7acb4589091f154214af6d0d49d3
