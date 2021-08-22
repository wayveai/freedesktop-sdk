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
  url: pypi:05/a5/87320d85c550bfaed61bd9bdd6c8b7170147995a7513c9defd8df24982fd/poetry-core-1.0.4.tar.gz
  sha256sum: 4b3847ad3e7b5deb88a35b23fa19762b9cef26828770cef3a5b47ffb508119c1
