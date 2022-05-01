kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-poetry-core.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: tomlkit
  ref:
    sha256sum: 30d54c0b914e595f3d10a87888599eab5321a2a69abc773bbefff51599b72db6
    suffix: 8b/95/c8826c61bd59c0d991fb1ca3d187d7fa803af13c1704be932e1071e041da/tomlkit-0.10.2.tar.gz
