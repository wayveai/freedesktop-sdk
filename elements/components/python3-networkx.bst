kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: networkx
  include:
  - '2.5'
  url: pypi:ef/d0/f706a9e5814a42c544fa1b2876fc33e5d17e1f2c92a5361776632c4f41ab/networkx-2.5.tar.gz
  sha256sum: 7978955423fbc9639c10498878be59caf99b44dc304c2286162fd24b458c1602
