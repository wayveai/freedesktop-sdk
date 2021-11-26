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
  url: pypi:39/23/3a151003b1d5e558f3cb806a4be443d9ed745d579fbe085d575509511a6f/meson-0.60.2.tar.gz
  sha256sum: 64e6968565bf1b8152f4f9d6ca8154efb9e14caa9aabf7b22e71e6c5d053e921
- kind: patch
  path: patches/meson/meson-no-lib64.patch
