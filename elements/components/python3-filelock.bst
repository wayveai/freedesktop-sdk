kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: filelock
  url: pypi:fd/6e/665a6cb363bee26e40954ee812e4e733fd7cafd84c06e0c7c2357641abd6/filelock-3.3.0.tar.gz
  sha256sum: 8c7eab13dc442dc249e95158bcc12dec724465919bdc9831fdbf0660f03d1785
