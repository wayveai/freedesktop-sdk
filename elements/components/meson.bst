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
  url: pypi:0f/f8/e67e447cb3c8fe391ad8cedd67cab81486831e37a3a028c9a6974fe63a38/meson-0.57.1.tar.gz
  sha256sum: 72e1c782ba9bda204f4a1ed57f98d027d7b6eb9414c723eebbd6ec7f1955c8a6
- kind: patch
  path: patches/meson/meson-no-lib64.patch
