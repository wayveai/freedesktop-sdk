kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-pytz.bst

sources:
- kind: pypi
  name: babel
  url: pypi:b0/91/c521fa4102ef9afc8c9f64d1828993d39b7e99944d40a76d4ef94f6321b2/Babel-2.10.2.tar.gz
  sha256sum: 7aed055f0c04c9e7f51a2f75261e41e1c804efa724cb65b60a970dd4448d469d
