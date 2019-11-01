kind: pip

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
- filename: components/python3-setuptools.bst
- filename: components/python3-pip.bst
  type: build

sources:
- kind: git_tag
  url: github:mesonbuild/meson.git
  track: '0.51'
  ref: 0.51.2-0-g6857936c592d6f9608add5a74a51ee405aaddc0d
- kind: patch
  path: patches/meson/meson-no-lib64.patch
