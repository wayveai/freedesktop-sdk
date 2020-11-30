kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: zipp
  url: pypi:ce/b0/757db659e8b91cb3ea47d90350d7735817fe1df36086afc77c1c4610d559/zipp-3.4.0.tar.gz
  sha256sum: ed5eee1974372595f9e416cc7bbeeb12335201d8081ca8a0743c954d4446e5cb
