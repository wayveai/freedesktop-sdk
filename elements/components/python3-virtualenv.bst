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
  url: pypi:e2/04/878273c00ec63df9acf76d1657155243c8874ca38833c62eface20ce15cd/virtualenv-20.7.0.tar.gz
  sha256sum: 97066a978431ec096d163e72771df5357c5c898ffdd587048f45e0aecc228094
