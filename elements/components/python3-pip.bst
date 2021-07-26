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
  url: pypi:f7/ce/e359cf283c0c0f2e0af7df8f16c8d79047aa1887a00a5b39b27d8afc49e2/pip-21.2.1.tar.gz
  sha256sum: 303a82aaa24cdc01f7ebbd1afc7d1b871a4aa0a88bb5bedef1fa86a3ee44ca0a
- kind: local
  path: files/pip/reproducible_tempfile.py

