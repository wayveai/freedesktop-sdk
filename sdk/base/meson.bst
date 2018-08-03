kind: distutils

depends:
  - filename: bootstrap-import.bst
  - filename: base/python3.bst

sources:
  - kind: git
    url: https://github.com/mesonbuild/meson.git
    track: master
    ref: 2495c38ac12a11141bcc0c49357049c83aa918e5 #  0.47.1
  - kind: patch
    path: patches/meson-no-lib64.patch
