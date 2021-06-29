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
  url: pypi:0e/75/92eed8e2ae8cd78f03c8ab9faf26e561482f3453a6f271a81e792178dd54/importlib_metadata-4.6.0.tar.gz
  sha256sum: 4a5611fea3768d3d967c447ab4e93f567d95db92225b43b7b238dbfb855d70bb
