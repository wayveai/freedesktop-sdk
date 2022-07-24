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
    sha256sum: 8d63fcd4ee293e30b644827268a0a973d080e5c7425ef26d427f5eb2126c7681
    suffix: cd/b6/cf07132d631444dd7ce0ed199f2327eb34e2418f1675145e5b10e1ee65cd/pip-22.2.tar.gz
