kind: pip

depends:
- bootstrap-import.bst
- components/python3.bst
- components/python3-setuptools.bst

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

sources:
- kind: pypi
  name: meson
  url: pypi:dd/01/3dba211a922c371044baa3ade48f3021e9b67e83c07b397f8eeeea99d3a6/meson-0.59.1.tar.gz
  sha256sum: db586a451650d46bbe10984a87b79d9bcdc1caebf38d8e189f8848f8d502356d
- kind: patch
  path: patches/meson/meson-no-lib64.patch
