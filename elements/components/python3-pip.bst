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
  url: pypi:e1/63/7c0e553ae0513ebf1858f08030158ff5998324013e0ba4c2e1c00b85df79/pip-21.2.3.tar.gz
  sha256sum: 91e66f2a2702e7d2dcc092ed8c5ebe923e69b9997ea28ba25823943bcd3bf820
- kind: local
  path: files/pip/reproducible_tempfile.py

