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
  url: pypi:03/d1/61bc0014abae384f098c3efcf79af133f3e1d53482b8e92ad5c70f34c5d1/meson-0.61.2.tar.gz
  sha256sum: 0233a7f8d959079318f6052b0939c27f68a5de86ba601f25c9ee6869fb5f5889
- kind: patch
  path: patches/meson/meson-no-lib64.patch
