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
    sha256sum: d86ea0bb50e06252d79e6c241507cb904fcd66090c3271381372d6221a3970f9
    suffix: 3c/ea/a39a173e7943a8f001e1f97326f88e1535b945a3aec31130c3029dce19df/virtualenv-20.16.3.tar.gz
