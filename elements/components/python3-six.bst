kind: pip

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
- filename: components/python3-setuptools.bst
- filename: components/python3-pip.bst
  type: build

sources:
- kind: pypi
  name: six
  url: pypi:6b/34/415834bfdafca3c5f451532e8a8d9ba89a21c9743a0c59fbd0205c7f9426/six-1.15.0.tar.gz
  sha256sum: 30639c035cdb23534cd4aa2dd52c3bf48f06e5f4a941509c8bafd8ce11080259
