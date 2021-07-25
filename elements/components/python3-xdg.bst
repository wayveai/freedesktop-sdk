kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-poetry.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: xdg
  url: pypi:33/fe/67bc1f8ee2782bca3cdc63558a64f843bb9f88e15793475350809fbd8e01/xdg-5.1.1.tar.gz
  sha256sum: aa619f26ccec6088b2a6018721d4ee86e602099b24644a90a8d3308a25acd06c
