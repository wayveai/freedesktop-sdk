kind: pip

depends:
- filename: bootstrap-import.bst
- filename: base/python3.bst

variables:
  pip: pip3
  fix-pyc-timestamps: "true"

sources:
- kind: git_tag
  url: github:mesonbuild/meson.git
  track: master
  ref: 0.49.1-0-g31ba7006ad705d31c980ab015a77eb39cf39366f
- kind: patch
  path: patches/meson/meson-no-lib64.patch
