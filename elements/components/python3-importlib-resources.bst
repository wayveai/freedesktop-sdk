kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: importlib-resources
  url: pypi:46/0b/7973c432eae095b60db1a37d6bf2c693cb4290b4d38d92f1bafe503c853d/importlib_resources-3.0.0.tar.gz
  sha256sum: 19f745a6eca188b490b1428c8d1d4a0d2368759f32370ea8fb89cad2ab1106c3
