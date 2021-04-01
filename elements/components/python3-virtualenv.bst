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
  url: pypi:f4/6d/bfcfff1709d05143e71337db4800b30dd9abf0c41972960c9e8984ab96f7/virtualenv-20.4.3.tar.gz
  sha256sum: 49ec4eb4c224c6f7dd81bb6d0a28a09ecae5894f4e593c89b0db0885f565a107
