kind: distutils

depends:
- bootstrap-import.bst
- components/python3.bst
- components/util-linux.bst

sources:
- kind: pypi
  name: setuptools
  ref:
    sha256sum: abcb76aa4decd7a17cbe0e4b31bdf549d106ba7f668e87e0860f5f7b84b9b3fe
    suffix: 00/26/6c26b879cbd65b3c4daf7327a4cb205f8541c695e5d44b0c2c65892c20d1/setuptools-63.4.2.tar.gz
