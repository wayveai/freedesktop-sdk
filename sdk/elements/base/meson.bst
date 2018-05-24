kind: distutils

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/python3.bst

sources:
  - kind: tar
    url: https://github.com/mesonbuild/meson/releases/download/0.46.1/meson-0.46.1.tar.gz
    ref: 19497a03e7e5b303d8d11f98789a79aba59b5ad4a81bd00f4d099be0212cee78
  - kind: patch
    path: patches/meson-no-lib64.patch
