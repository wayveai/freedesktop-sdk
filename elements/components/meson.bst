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
  track: 0.51
  ref: 0.51.1-0-g3ea194b8d9cdd0197403efdca8fa2e8147fc1eb8
- kind: patch
  path: patches/meson/meson-no-lib64.patch
