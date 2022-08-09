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
    sha256sum: d1b49c3e460f5910b22d799b13513504acb4f5fcaee01660ee66f07bd45a271c
    suffix: eb/e3/7b0bcc571314a728c2f84144ba72ca01f6ac68a645a1ac1848f2efd7948d/tomlkit-0.11.2.tar.gz
