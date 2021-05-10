kind: pip

depends:
- bootstrap-import.bst
- components/python3.bst
- components/python3-setuptools.bst

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

sources:
- kind: git_tag
  url: github:mesonbuild/meson.git
  track: '0.56'
  ref: 0.56.2-0-g5f73f3b715f39217e7d063b6b112c5c80010379c
- kind: patch
  path: patches/meson/meson-no-lib64.patch
