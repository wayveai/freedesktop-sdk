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
  url: pypi:18/c0/36f3e535bf1fef10a8f0f6fbf5ea5f2a39e0a24b4b308058fc78af5237c5/setuptools-54.1.1.tar.gz
  sha256sum: 1ce82798848a978696465866bb3aaab356003c42d6143e1111fcf069ac838274
