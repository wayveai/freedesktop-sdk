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
  url: pypi:f1/6d/6c92388af71432c2261476f60c254c3982b6b02f66a33e88a14cc845a8b5/virtualenv-20.13.2.tar.gz
  sha256sum: 01f5f80744d24a3743ce61858123488e91cb2dd1d3bdf92adaf1bba39ffdedf0
