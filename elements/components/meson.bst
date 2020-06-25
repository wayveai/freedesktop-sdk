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
  track: master
  track-extra:
  - '0.53'
  ref: 0.54.0-0-g15b0bd6e937a6676b818268378882c5a0a33a33b
- kind: patch
  path: patches/meson/meson-no-lib64.patch
