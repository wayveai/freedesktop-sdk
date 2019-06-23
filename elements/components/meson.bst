kind: pip

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
- filename: components/python3-pip.bst

variables:
  pip: pip3
  fix-pyc-timestamps: "true"

sources:
- kind: git_tag
  url: github:mesonbuild/meson.git
  track: master
  track-extra:
  - '0.51'
  ref: 0.51.0-0-g5ecab576673d98b01296ef02c8bc9300c5f6e796
- kind: patch
  path: patches/meson/meson-no-lib64.patch
