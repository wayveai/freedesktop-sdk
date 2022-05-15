kind: distutils

depends:
- bootstrap-import.bst
- components/python3.bst
- components/util-linux.bst

sources:
- kind: pypi
  name: setuptools
  ref:
    sha256sum: ca6ba73b7fd5f734ae70ece8c4c1f7062b07f3352f6428f6277e27c8f5c64237
    suffix: b1/77/75f6543eafdffc0b3f07f99682497bea817ef0b6c361fe72b932eb82459c/setuptools-62.2.0.tar.gz
