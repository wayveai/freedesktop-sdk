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
  url: pypi:c6/3e/d00f1500aa0e8a69323101c33f6e6910bbc68d34df3e8a0b1e510219a956/virtualenv-20.2.2.tar.gz
  sha256sum: b7a8ec323ee02fb2312f098b6b4c9de99559b462775bc8fe3627a73706603c1b
