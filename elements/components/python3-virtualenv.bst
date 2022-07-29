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
    sha256sum: 0ef5be6d07181946891f5abc8047fda8bc2f0b4b9bf222c64e6e8963baee76db
    suffix: 9d/17/5a822952d90f791947f9d1d11c84c055ffc3b7a315c2552d4f46a0d6cd12/virtualenv-20.16.2.tar.gz
