kind: distutils

depends:
  - filename: bootstrap-import.bst
  - filename: base/python3.bst

sources:
  - kind: git
    url: https://github.com/mesonbuild/meson.git
    track: master
    ref: 8d8b1b02075e81a0c775df8ea828d8e2a57876e8 #  0.46.1
  - kind: patch
    path: patches/meson-no-lib64.patch
