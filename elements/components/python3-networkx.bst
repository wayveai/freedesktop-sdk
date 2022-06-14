kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: networkx
  include:
  - '2\.8(\.|$)'
  exclude:
  - '.*rc.*'
  ref:
    sha256sum: 5e53f027c0d567cf1f884dbb283224df525644e43afd1145d64c9d88a3584762
    suffix: 5d/3b/9ca0d8bbfbf418eb158fe7b8a5e4233ddc390d995cfb1dd32726dba8c8e5/networkx-2.8.4.tar.gz
