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
  ref:
    sha256sum: 4a52cf66aed221955420e11b3e2e05ca44196b4829aab9576d4d439212b0a14f
    suffix: 3f/5e/5e9ae193c6384bd47aae5bc9bd2c48db7115f483b0ff9fef7d263e3dbb09/networkx-2.8.tar.gz
