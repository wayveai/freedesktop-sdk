kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-poetry.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: xdg
  url: pypi:61/c6/2d0721a9c8b2789e0127521d8b259bf2e2400dd4a12a0add8a5cc239e9f9/xdg-5.0.2.tar.gz
  sha256sum: 99a685c23dd6201b852f345f28f32099524d2677967cd413b74b39a62a866062
