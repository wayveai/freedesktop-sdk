kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-toml.bst

depends:
- components/python3.bst
- components/python3-cffi.bst
- components/python3-six.bst

sources:
- kind: pypi
  name: cryptography
  include:
  - 3\.3\..*
  url: pypi:d4/85/38715448253404186029c575d559879912eb8a1c5d16ad9f25d35f7c4f4c/cryptography-3.3.2.tar.gz
  sha256sum: 5a60d3780149e13b7a6ff7ad6526b38846354d11a15e21068e57073e29e19bed
