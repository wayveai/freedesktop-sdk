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
- kind: tar
  url: pypi:aa/bd/2a3082a5af997eef7324a3557d2ef3fa641e064c79c33404013310297e45/virtualenv-20.0.31.tar.gz
  ref: 43add625c53c596d38f971a465553f6318decc39d98512bc100fa1b1e839c8dc
