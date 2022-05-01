kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/cython.bst

depends:
- components/python3.bst
- components/libyaml.bst

sources:
- kind: pypi
  name: pyyaml

