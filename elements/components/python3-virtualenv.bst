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
  url: pypi:6a/95/01db50116d85cd4604b570c370a3b718de99ac44c95d3ee27a753f7ff02a/virtualenv-20.11.2.tar.gz
  sha256sum: 7f9e9c2e878d92a434e760058780b8d67a7c5ec016a66784fe4b0d5e50a4eb5c
