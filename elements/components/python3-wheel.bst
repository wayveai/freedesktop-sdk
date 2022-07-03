kind: manual

build-depends:
- components/python3-installer.bst

depends:
- components/python3.bst
- components/python3-setuptools.bst

environment:
  PYTHONPATH: "%{build-root}/src"

config:
  build-commands:  
  - |
    python3 setup.py bdist_wheel

  install-commands:
  - |
    python3 -minstaller dist/*.whl --destdir %{install-root}

sources:
- kind: pypi
  name: wheel
  ref:
    sha256sum: e9a504e793efbca1b8e0e9cb979a249cf4a0a7b5b8c9e8b65a5e39d49529c1c4
    suffix: c0/6c/9f840c2e55b67b90745af06a540964b73589256cb10cc10057c87ac78fc2/wheel-0.37.1.tar.gz
