kind: distutils

depends:
- bootstrap-import.bst
- components/python3.bst
- components/util-linux.bst

sources:
- kind: pypi
  name: setuptools
  ref:
    sha256sum: bf8a748ac98b09d32c9a64a995a6b25921c96cc5743c1efa82763ba80ff54e91
    suffix: 0c/f0/f11edc0efc7b00e26a28225621ce7584636bb3a76b1862829d42bc146fbf/setuptools-62.4.0.tar.gz
