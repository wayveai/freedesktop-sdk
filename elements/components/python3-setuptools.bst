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
  url: pypi:0b/bb/a212bcfd147edcbca13ba95691411d7843bfeeb5165857abf4e9a0822e99/setuptools-54.0.0.tar.gz
  sha256sum: 34efee89c4c879204f5739ec6d9d3635195b0b7d2b51e25c9261a327367ec5ff
