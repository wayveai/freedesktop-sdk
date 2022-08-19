kind: distutils

depends:
- bootstrap-import.bst
- components/python3.bst
- components/util-linux.bst

sources:
- kind: pypi
  name: setuptools
  ref:
    sha256sum: d2e010624c781b26ad6629a8de9832327cf853dea93894487979e55f9ad06857
    suffix: 45/8d/00ecdc169f2ed7d95e1076c63cdf4315d92c875e9cff2e595b6b410fb8d6/setuptools-65.1.0.tar.gz
