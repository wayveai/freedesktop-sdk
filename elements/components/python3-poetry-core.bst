kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3.bst
- components/python3-intreehooks.bst
- components/python3-pytoml.bst

sources:
- kind: tar
  url: pypi:90/cd/b65ab6b3a3a44a474f43a7906f31a1b159ffa63bebd7125ed1f91c06c5e4/poetry-core-1.0.0a9.tar.gz
  ref: f08e9829fd06609ca5615faa91739b589eb71e025a6aaf7ddffb698676eb7c8c
