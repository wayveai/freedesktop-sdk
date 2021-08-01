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
  url: pypi:83/37/3f344e392de7792748ee32e05d7dd6f867eb2166c21c8711280fb30e2128/pip-21.2.2.tar.gz
  sha256sum: 38e9250dfb0d7fa842492bede9259d4b3289a936ce454f7c58f059f28a94c01d
- kind: local
  path: files/pip/reproducible_tempfile.py

