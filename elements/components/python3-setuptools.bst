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
  url: pypi:02/b5/456e90af3712ca1b25c60ed74d0facb8b65cbaaa42cdceedf3b210580eef/setuptools-58.4.0.tar.gz
  sha256sum: af632270cb4b5ca0ebd272ac1939a3e8f76aa975d2722e999cfdcea2b9e824cb
