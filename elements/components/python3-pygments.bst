kind: pip

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
- filename: components/python3-pip.bst
  type: build

sources:
- kind: pypi
  name: pygments
  url: pypi:b7/b3/5cba26637fe43500d4568d0ee7b7362de1fb29c0e158d50b4b69e9a40422/Pygments-2.10.0.tar.gz
  sha256sum: f398865f7eb6874156579fdf36bc840a03cab64d1cde9e93d68f46a425ec52c6
