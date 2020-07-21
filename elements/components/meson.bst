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
  - '0.54'
  ref: 0.55.0-0-gd0c68dc11507a47b9b85de508e023d9590d60565
- kind: patch
  path: patches/meson/meson-no-lib64.patch
- kind: patch
  path: patches/meson/aarch64-can-potentially-build-arm.patch
