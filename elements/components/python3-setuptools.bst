kind: distutils

depends:
- bootstrap-import.bst
- components/python3.bst
- components/util-linux.bst

sources:
- kind: pypi
  name: setuptools
  ref:
    sha256sum: e7d11f3db616cda0751372244c2ba798e8e56a28e096ec4529010b803485f3fe
    suffix: fb/50/005826d31d58a7b90585b5510f2f597c5406ae34df884f4f5d63abfb6ca7/setuptools-62.3.3.tar.gz
