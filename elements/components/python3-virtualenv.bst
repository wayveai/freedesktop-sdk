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
  url: pypi:dd/40/9bc1b32521f78c293c1f8ca423c725737dfa9d09640dbeec61cebca7c5f2/virtualenv-20.8.1.tar.gz
  sha256sum: bcc17f0b3a29670dd777d6f0755a4c04f28815395bca279cdcb213b97199a6b8
