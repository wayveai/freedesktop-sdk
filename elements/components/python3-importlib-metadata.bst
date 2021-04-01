kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

depends:
- components/python3.bst
- components/python3-zipp.bst

sources:
- kind: pypi
  name: importlib-metadata
  url: pypi:8e/33/d54eacc679af34dc7c03fe9f3383669095b27fa17bd820cd33ec957cb249/importlib_metadata-3.10.0.tar.gz
  sha256sum: c9db46394197244adf2f0b08ec5bc3cf16757e9590b02af1fca085c16c0d600a
