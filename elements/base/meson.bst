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
  ref: 0.48.2-0-g68140552be927d6a5dd7fd7d777e26cb7dfe32c5
- kind: patch
  path: patches/meson-no-lib64.patch
