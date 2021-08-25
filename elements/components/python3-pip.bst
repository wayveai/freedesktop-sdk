kind: distutils

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
- filename: components/python3-setuptools.bst

config:
  build-commands:
  - cp reproducible_tempfile.py src/pip/_internal/utils/tempfile.py
  install-commands:
    (>):
    - |
      rm "%{install-root}%{bindir}/pip"

sources:
- kind: pypi
  name: pip
  url: pypi:52/e1/06c018197d8151383f66ebf6979d951995cf495629fc54149491f5d157d0/pip-21.2.4.tar.gz
  sha256sum: 0eb8a1516c3d138ae8689c0c1a60fde7143310832f9dc77e11d8a4bc62de193b
- kind: local
  path: files/pip/reproducible_tempfile.py

