kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: cachy
- kind: patch
  path: patches/python3-cachy/no-install-tests.patch
