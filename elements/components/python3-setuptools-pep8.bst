kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-setuptools.bst
- components/python3-pep8.bst

sources:
- kind: pypi
  name: setuptools_pep8

