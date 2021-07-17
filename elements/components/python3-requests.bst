kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst

runtime-depends:
- components/python3-urllib3.bst
- components/python3-certifi.bst
- components/python3-idna.bst
- components/python3-chardet.bst
- components/python3-charset-normalizer.bst

sources:
- kind: pypi
  name: requests
  url: pypi:e7/01/3569e0b535fb2e4a6c384bdbed00c55b9d78b5084e0fb7f4d0bf523d7670/requests-2.26.0.tar.gz
  sha256sum: b8aa58f8cf793ffd8782d3d8cb19e66ef36f7aba4353eec859e74678b01b07a7
