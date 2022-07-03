kind: manual

build-depends:
- components/python3-installer.bst

depends:
- components/python3.bst
- components/python3-setuptools.bst
- components/python3-wheel.bst

config:
  build-commands:
  - |
    python3 setup.py bdist_wheel

  install-commands:
  - |
    python3 -minstaller dist/*.whl --destdir %{install-root}

sources:
- kind: pypi
  name: pip
  ref:
    sha256sum: 6d55b27e10f506312894a87ccc59f280136bad9061719fac9101bdad5a6bce69
    suffix: 4b/b6/0fa7aa968a9fa4ef63a51b3ff0644e59f49dcd7235b3fd6cceb23f202e08/pip-22.1.2.tar.gz
