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
  ref: 0.49.2-0-g237e2e7243e14101e99d66e047037e400118992d
- kind: patch
  path: patches/meson/meson-no-lib64.patch
