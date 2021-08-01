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
  url: pypi:58/f1/9b77b8aa38482b7c284b8f8eda8b99d3b1103a280f107bab362a1c518c92/importlib_metadata-4.6.3.tar.gz
  sha256sum: 0645585859e9a6689c523927a5032f2ba5919f1f7d0e84bd4533312320de1ff9
