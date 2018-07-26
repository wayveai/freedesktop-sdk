kind: distutils

depends:
  - filename: bootstrap-import.bst
  - filename: base/python3.bst
  - filename: base/python3-setuptools.bst
    type: build

variables:
  python: python3

sources:
  - kind: tar
    url: https://files.pythonhosted.org/packages/69/81/52b68d0a4de760a2f1979b0931ba7889202f302072cc7a0d614211bc7579/pip-18.0.tar.gz
    ref: a0e11645ee37c90b40c46d607070c4fd583e2cd46231b1c06e389c5e814eed76
