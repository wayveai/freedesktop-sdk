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
  url: pypi:c7/3e/b11275c99dd779e4fc87931f7c82ce93767080249bfa4d7aea7ea748800e/virtualenv-20.10.0.tar.gz
  sha256sum: 576d05b46eace16a9c348085f7d0dc8ef28713a2cabaa1cf0aea41e8f12c9218
