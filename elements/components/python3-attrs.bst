kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

sources:
- kind: pypi
  name: attrs
  url: pypi:c4/d4/c2b5232ecfc0783c697a81c13efc53a4fe285d4e2c00e0d8aed90495fade/attrs-20.1.0.tar.gz
  sha256sum: 0ef97238856430dcf9228e07f316aefc17e8939fc8507e18c6501b761ef1a42a
