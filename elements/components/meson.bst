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
  track: '0.55'
  ref: 0.55.3-0-g776acd2a805c9b42b4f0375150977df42130317f
- kind: patch
  path: patches/meson/meson-no-lib64.patch
- kind: patch
  path: patches/meson/aarch64-can-potentially-build-arm.patch
