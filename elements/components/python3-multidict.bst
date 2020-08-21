kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst
- components/cython.bst

sources:
- kind: pypi
  name: multidict
  url: pypi:65/d4/fabdcc5ee4451c8a8e177e27ddfd131a53a82ecc5a3b68468b7e9f8d70b4/multidict-4.7.6.tar.gz
  sha256sum: fbb77a75e529021e7c4a8d4e823d88ef4d23674a202be4f5addffc72cbb91430
