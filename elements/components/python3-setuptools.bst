kind: distutils

depends:
- bootstrap-import.bst
- components/python3.bst
- components/util-linux.bst

sources:
- kind: pypi
  name: setuptools
  ref:
    sha256sum: 990a4f7861b31532871ab72331e755b5f14efbe52d336ea7f6118144dd478741
    suffix: dc/73/88920663229023b724a854d1ab7e3e50a1a28b63eeec399a604ba30f9242/setuptools-62.6.0.tar.gz
