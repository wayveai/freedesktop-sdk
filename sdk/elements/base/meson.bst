kind: distutils

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/python3.bst

sources:
  - kind: tar
    url: https://github.com/mesonbuild/meson/releases/download/0.45.1/meson-0.45.1.tar.gz
    ref: 4d0bb0dbb1bb556cb7a4092fdfea3d6e76606bd739a4bc97481c2d7bc6200afb
