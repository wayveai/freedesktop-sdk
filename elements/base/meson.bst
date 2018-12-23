kind: pip

depends:
- filename: bootstrap-import.bst
- filename: base/python3.bst

variables:
  pip: pip3

sources:
- kind: git_tag
  url: github:mesonbuild/meson.git
  track: master
  ref: 0.49.0-0-g51aaa15bda0e955e45da014ca7720d038219eeff
- kind: patch
  path: patches/meson-no-lib64.patch
