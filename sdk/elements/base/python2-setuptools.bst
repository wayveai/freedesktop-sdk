kind: distutils

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/python2.bst

variables:
  python: python2

sources:
  - kind: zip
    url: https://pypi.python.org/packages/69/56/f0f52281b5175e3d9ca8623dadbc3b684e66350ea9e0006736194b265e99/setuptools-38.2.4.zip
    ref: 9c671a6291a5b1171fb9da81665eb4f9625c7dbddc613d82abdc6002a4bce896
