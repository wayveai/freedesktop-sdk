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
  url: pypi:14/f7/c064250ee08ab28cb6f55f09311ea0a1b05ac837eb7b51363ef1733c9168/setuptools-59.3.0.tar.gz
  sha256sum: da27016d4b3b89cc9b672d93597520e44afa3f87a9aac32d3f084f37fa667ce7
