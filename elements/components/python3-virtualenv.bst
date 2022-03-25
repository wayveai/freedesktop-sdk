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
  url: pypi:4a/71/5d3cefcf514e2edb468669558092caa8673c352fd798e47cf8a4bb3a1566/virtualenv-20.13.4.tar.gz
  sha256sum: ce8901d3bbf3b90393498187f2d56797a8a452fb2d0d7efc6fd837554d6f679c
