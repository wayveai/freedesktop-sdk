kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: pyexpect

config:
  build-commands:
  - rm -r tests
