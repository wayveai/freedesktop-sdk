kind: pip

depends:
- bootstrap-import.bst
- components/python3.bst
- components/python3-setuptools.bst

build-depends:
- components/python3-pip.bst

sources:
- kind: pypi
  name: wheel
  url: pypi:83/72/611c121b6bd15479cb62f1a425b2e3372e121b324228df28e64cc28b01c2/wheel-0.35.1.tar.gz
  sha256sum: 99a22d87add3f634ff917310a3d87e499f19e663413a52eb9232c447aa646c9f
