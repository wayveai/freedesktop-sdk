kind: pip

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
- filename: components/python3-setuptools.bst
- filename: components/python3-pip.bst
  type: build

sources:
- kind: pypi
  name: mako
  url: pypi:72/89/402d2b4589e120ca76a6aed8fee906a0f5ae204b50e455edd36eda6e778d/Mako-1.1.3.tar.gz
  sha256sum: 8195c8c1400ceb53496064314c6736719c6f25e7479cd24c77be3d9361cddc27
