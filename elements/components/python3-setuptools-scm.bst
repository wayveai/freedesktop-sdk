kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

depends:
- components/python3.bst
- components/python3-setuptools.bst
- components/git-minimal.bst
- components/python3-tomli.bst
- components/python3-packaging.bst

sources:
- kind: pypi
  name: setuptools_scm

