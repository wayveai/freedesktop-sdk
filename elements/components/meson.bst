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
  url: pypi:b6/0a/9ae8a4d83263eee8f7357447f1e14f0e39b04a4994aa9884b7e14a91f530/meson-0.56.2.tar.gz
  sha256sum: 3cb8bdb91383f7f8da642f916e4c44066a29262caa499341e2880f010edb87f4
- kind: patch
  path: patches/meson/meson-no-lib64.patch
