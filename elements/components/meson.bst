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
  url: pypi:d7/c5/d758dde8cedce417cd2c784152946377a55168e7d70ea310dd7b63fac9b5/meson-0.59.3.tar.gz
  sha256sum: 0a35cfd4cb779a6a415ad3ccbf2d4143334e96139125585ce49915bec494da02
- kind: patch
  path: patches/meson/meson-no-lib64.patch
