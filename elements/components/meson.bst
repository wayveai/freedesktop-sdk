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
  url: pypi:08/a0/4d3a1eb46c83a96b49c100c30762c8f1a60b62367dd052ab8730e73ab46b/meson-0.56.0.tar.gz
  sha256sum: 291dd38ff1cd55fcfca8fc985181dd39be0d3e5826e5f0013bf867be40117213
- kind: patch
  path: patches/meson/meson-no-lib64.patch
