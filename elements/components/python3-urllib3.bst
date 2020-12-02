kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst

sources:
- kind: pypi
  name: urllib3
  url: pypi:29/e6/d1a1d78c439cad688757b70f26c50a53332167c364edb0134cadd280e234/urllib3-1.26.2.tar.gz
  sha256sum: 19188f96923873c92ccb987120ec4acaa12f0461fa9ce5d3d0772bc965a39e08
