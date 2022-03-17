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
  url: pypi:c5/75/e0ab1a664b3ca2ee3cab32854fc44d85e0b1cb0c13dd8061ccb7dc0369f4/meson-0.61.3.tar.gz
  sha256sum: 9c884434469471f3fe0cbbceb9b9ea0c8047f19e792940e1df6595741aae251b
- kind: patch
  path: patches/meson/meson-no-lib64.patch
