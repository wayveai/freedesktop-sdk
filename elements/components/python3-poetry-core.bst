kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3.bst
- components/python3-intreehooks.bst
- components/python3-pytoml.bst

sources:
- kind: pypi
  name: poetry-core
  url: pypi:42/21/5335c7eceff3dccb3b415018bb17db0c442b599f610fd5712021d5f9403f/poetry-core-1.0.0.tar.gz
  sha256sum: 6a664ff389b9f45382536f8fa1611a0cb4d2de7c5a5c885db1f0c600cd11fbd5
