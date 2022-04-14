kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: importlib-resources
  url: pypi:9d/cf/64d938a85a0c0c0a04e29de3323d457589d650fa26694de787367151b31d/importlib_resources-5.7.0.tar.gz
  sha256sum: f6a4a9949f36ae289facec8dac1a899a54cbaf6a135cc8552d2c8b69209c06a3
