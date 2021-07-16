kind: distutils

depends:
- bootstrap-import.bst
- components/python3.bst
- components/util-linux.bst

config:
  configure-commands:
    (<):
    - |
      python3 bootstrap.py

sources:
- kind: pypi
  name: setuptools
  url: pypi:1d/32/94680de1e9153e4fd9d15f82a919c732a046a851b2ccd0c5b05f4ece346b/setuptools-57.2.0.tar.gz
  sha256sum: a7e88b9bbaece494162d697d19525c567ab60c85dd7e2fd90cb7dfe8d8129a62
