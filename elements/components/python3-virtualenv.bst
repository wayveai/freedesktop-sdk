kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-appdirs.bst
- components/python3-distlib.bst
- components/python3-filelock.bst
- components/python3-six.bst
- components/python3-importlib-metadata.bst
- components/python3-importlib-resources.bst
- components/python3-pathlib2.bst

sources:
- kind: pypi
  name: virtualenv
  url: pypi:8b/67/67e5dd2d1676c3fa8a67c707114325d713feadb7824d9aaf2396be5401d3/virtualenv-20.9.0.tar.gz
  sha256sum: bb55ace18de14593947354e5e6cd1be75fb32c3329651da62e92bf5d0aab7213
