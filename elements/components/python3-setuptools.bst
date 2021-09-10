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
  url: pypi:9a/74/de4d8c69466b6413b1616048b39f8b73d65f98c15f6202b68ccfc9550f1f/setuptools-58.0.4.tar.gz
  sha256sum: f10059f0152e0b7fb6b2edd77bcb1ecd4c9ed7048a826eb2d79f72fd2e6e237b
