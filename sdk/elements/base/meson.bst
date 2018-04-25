kind: distutils

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/python3.bst

sources:
  - kind: tar
    url: https://github.com/mesonbuild/meson/releases/download/0.46.0/meson-0.46.0.tar.gz
    ref: b7df91b01a358a8facdbfa33596a47cda38a760435ab55e1985c0bff06a9cbf0
