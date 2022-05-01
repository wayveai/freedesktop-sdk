kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-decorator.bst # This should be gone with 2.6 update

sources:
- kind: pypi
  name: networkx
  include:
  - '2.5'

