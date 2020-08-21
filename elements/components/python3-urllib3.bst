kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst

sources:
- kind: pypi
  name: urllib3
  url: pypi:81/f4/87467aeb3afc4a6056e1fe86626d259ab97e1213b1dfec14c7cb5f538bf0/urllib3-1.25.10.tar.gz
  sha256sum: 91056c15fa70756691db97756772bb1eb9678fa585d9184f24534b100dc60f4a
