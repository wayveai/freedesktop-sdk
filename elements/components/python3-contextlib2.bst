kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: contextlib2
  url: pypi:02/54/669207eb72e3d8ae8b38aa1f0703ee87a0e9f88f30d3c0a47bebdb6de242/contextlib2-0.6.0.post1.tar.gz
  sha256sum: 01f490098c18b19d2bd5bb5dc445b2054d2fa97f09a4280ba2c5f3c394c8162e
