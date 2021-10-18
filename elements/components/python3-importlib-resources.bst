kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: importlib-resources
  url: pypi:e6/eb/9a21e2ae696a0530c73304f9d1d3c063065f82d3562822b55466c6ef62ef/importlib_resources-5.2.3.tar.gz
  sha256sum: 203d70dda34cfbfbb42324a8d4211196e7d3e858de21a5eb68c6d1cdd99e4e98
