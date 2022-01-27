kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-appdirs.bst
- components/python3-distlib.bst
- components/python3-filelock.bst
- components/python3-six.bst
- components/python3-importlib-metadata.bst
- components/python3-importlib-resources.bst
- components/python3-pathlib2.bst

sources:
- kind: pypi
  name: virtualenv
  url: pypi:f1/db/4498de0294f0c72a2e0a099d1588e7b55d0c849db740c89978ff73700519/virtualenv-20.13.0.tar.gz
  sha256sum: d8458cf8d59d0ea495ad9b34c2599487f8a7772d796f9910858376d1600dd2dd
