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
  url: pypi:e2/a1/f6a76cc83255016ded5aa33a5db637c7d31ed51ee8e367139b9c7eae669e/virtualenv-20.13.3.tar.gz
  sha256sum: e9dd1a1359d70137559034c0f5433b34caf504af2dc756367be86a5a32967134
