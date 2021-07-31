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
  url: pypi:78/65/3414780efd858fc0d71c8aa4191c952041a35df229f98452e274a94b689c/importlib_metadata-4.6.2.tar.gz
  sha256sum: 75858eea2febdbbaf83e2242270a29aba654e7fbf34de4a559e2f3873878eba4
