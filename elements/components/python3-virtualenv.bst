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
  url: pypi:d4/f9/e65670c81f7b6a4131fdb0ee42f2d5d4be42e89e6ffd04d4a43bd1c4ff8e/virtualenv-20.6.0.tar.gz
  sha256sum: 51df5d8a2fad5d1b13e088ff38a433475768ff61f202356bb9812c454c20ae45
