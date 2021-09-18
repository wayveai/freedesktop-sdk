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
  url: pypi:39/2f/84439468561782ed91d9f9499738fb52a84e4d65f164849e7050db7834e5/virtualenv-20.8.0.tar.gz
  sha256sum: 4da4ac43888e97de9cf4fdd870f48ed864bbfd133d2c46cbdec941fed4a25aef
