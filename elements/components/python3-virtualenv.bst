kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-appdirs.bst
- components/python3-distlib.bst
- components/python3-filelock.bst
- components/python3-six.bst
- components/python3-pathlib2.bst

sources:
- kind: pypi
  name: virtualenv
  ref:
    sha256sum: 6cc42cad4d1a15c7ea5ed68e602eb49cc243b52d2eead36e577555cb56bf8705
    suffix: 6d/0e/0c41bda51d1bd283c69484c932646fcad0b5a36ff5ac9535e4be93aeb89c/virtualenv-20.16.1.tar.gz
