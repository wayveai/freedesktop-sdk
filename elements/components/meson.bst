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
  url: pypi:32/a2/b31eb5fe8d75e29b9b271404f50fe46eae5b143794105d0ae2371e7e93d5/meson-0.59.2.tar.gz
  sha256sum: 13dee549a7ba758b7e33ce7719f28d1d337a98d10d378a4779ccc996f5a2fc49
- kind: patch
  path: patches/meson/meson-no-lib64.patch
