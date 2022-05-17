kind: distutils

depends:
- bootstrap-import.bst
- components/python3.bst
- components/util-linux.bst

sources:
- kind: pypi
  name: setuptools
  ref:
    sha256sum: d4eebe23c2ed4d73fa69d4f78e4b59b9648cbd22c43018ee2e8b911866535463
    suffix: 2b/ca/795fe59736dcc0bd7ff85239ebd017aec6c294983c469b40ee4ef44ca950/setuptools-62.3.0.tar.gz
