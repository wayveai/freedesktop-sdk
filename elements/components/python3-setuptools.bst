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
  url: pypi:88/fc/d17731c0cc67a5a8e385e4f47c3b0b186720e198b70f076ccb4676804a8f/setuptools-57.0.0.tar.gz
  sha256sum: 401cbf33a7bf817d08014d51560fc003b895c4cdc1a5b521ad2969e928a07535
