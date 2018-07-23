kind: distutils

depends:
  - filename: bootstrap-import.bst
  - filename: base/python2.bst

variables:
  python: python2

sources:
  - kind: zip
    url: https://files.pythonhosted.org/packages/d3/3e/1d74cdcb393b68ab9ee18d78c11ae6df8447099f55fe86ee842f9c5b166c/setuptools-40.0.0.zip
    ref: 012adb8e25fbfd64c652e99e7bab58799a3aaf05d39ab38561f69190a909015f
