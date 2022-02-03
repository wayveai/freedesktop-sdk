kind: distutils

depends:
- bootstrap-import.bst
- components/python3.bst
- components/util-linux.bst

sources:
- kind: pypi
  name: setuptools
  url: pypi:29/dd/48d662bb93e5e51e72265ef612f869947d4ae4126328d7156824cd50d440/setuptools-60.7.0.tar.gz
  sha256sum: b83cf328a4f6a987c95610e76b29a30778db05174eef71f771776c48f8f25d1b
