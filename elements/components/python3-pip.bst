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
    sha256sum: 50516e47a2b79e77446f0d05649f0d53772c192571486236b1905492bfc24bac
    suffix: 46/28/addd7e66bb3af799d35a5dcbb79407b591a7ed674f4efd2bd8f930c40821/pip-22.2.1.tar.gz
