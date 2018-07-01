kind: distutils

depends:
  - filename: bootstrap-import.bst
  - filename: base/python3.bst

sources:
  - kind: git
    url: https://github.com/mesonbuild/meson.git
    track: master
    ref: 5d0821946404322152319f7f2b22b96477ac406e #  0.47.0
  - kind: patch
    path: patches/meson-no-lib64.patch
