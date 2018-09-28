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
    ref: 0cf4a6ab3aa3672d74091e28f6535477794d9839 #  0.48.0
  - kind: patch
    path: patches/meson-no-lib64.patch
