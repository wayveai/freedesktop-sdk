kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/pkg-config.bst
- components/python3-pkgconfig.bst
- components/python3-pycparser.bst
- components/python3-setuptools-scm.bst
- components/tpm2-tss.bst

depends:
- components/python3.bst
- components/python3-cffi.bst
- components/python3-cryptography.bst
- components/python3-packaging.bst
- components/python3-asn1crypto.bst

sources:
- kind: pypi
  name: tpm2-pytss
  url: pypi:b5/bd/92b4cbb46f730c82f074d01d60f8dc2a816c4b72fed9d3dc2a45eed3af5f/tpm2-pytss-1.1.0.tar.gz
  sha256sum: 3b47756fdf7f57c6f77a66e0f2f79ead3ac919255bfe9ae53d56fba921c4add4
