kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: networkx
  include:
  - '1.11'
  url: pypi:3b/d4/1b6ca16678d13ffd426bcd199231f3d5effaa6d234747fb88899e649dec3/networkx-1.11.zip
  sha256sum: b3e0144d5fe6b7479b694e1b598a5545a38f3fc6f1e3c09173eb30f0c7a5770e
