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
  track: '0.54'
  ref: 0.54.3-0-g348deff3bf527280558e2f515f65e5c1b109f928
- kind: patch
  path: patches/meson/meson-no-lib64.patch
- kind: patch
  path: patches/meson/aarch64-can-potentially-build-arm.patch
