kind: pip

depends:
  - filename: bootstrap-import.bst
  - filename: base/python3.bst

variables:
  pip: pip3

sources:
  - kind: git
    url: https://github.com/mesonbuild/meson.git
    track: master
    ref: 0a5ff338012a00f32c3aa9d8773835accc3e4e5b #  0.47.2
  - kind: patch
    path: patches/meson-no-lib64.patch
