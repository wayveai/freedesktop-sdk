kind: distutils

depends:
  - filename: base/python2.bst
  - filename: base/python2-setuptools.bst
    type: build

variables:
  python: python2

sources:
  - kind: tar
    url: https://pypi.python.org/packages/11/b6/abcb525026a4be042b486df43905d6893fb04f05aac21c32c638e939e447/pip-9.0.1.tar.gz
    ref: 09f243e1a7b461f654c26a725fa373211bb7ff17a9300058b205c61658ca940d
