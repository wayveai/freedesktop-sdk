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
  url: pypi:79/64/203241c2e2b5abfd5edca4e28242c21bf8a9e84490873e4a8a155a9658fc/virtualenv-20.4.2.tar.gz
  sha256sum: 147b43894e51dd6bba882cf9c282447f780e2251cd35172403745fc381a0a80d
