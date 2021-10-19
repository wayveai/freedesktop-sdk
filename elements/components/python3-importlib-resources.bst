kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: importlib-resources
  url: pypi:35/d2/d0bdb7d46318a8ee2a63ef130a384fd675bc833f7641e7371cbd9648af74/importlib_resources-5.3.0.tar.gz
  sha256sum: f2e58e721b505a79abe67f5868d99f8886aec8594c962c7490d0c22925f518da
