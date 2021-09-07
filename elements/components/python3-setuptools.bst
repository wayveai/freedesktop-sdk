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
  url: pypi:11/c6/9e16df5a5526f7dd2ad17284928e36fc341305fe74c7ab06bb5960a5da94/setuptools-58.0.2.tar.gz
  sha256sum: 19e48d0270a86c996bf09e5282584d3c0adf407f37f0aa6e3c762a349ff41811
