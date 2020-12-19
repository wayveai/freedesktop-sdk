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
  url: pypi:ed/46/e298a50dde405e1c202e316fa6a3015ff9288423661d7ea5e8f22f589071/wheel-0.36.2.tar.gz
  sha256sum: e11eefd162658ea59a60a0f6c7d493a7190ea4b9a85e335b33489d9f17e0245e
