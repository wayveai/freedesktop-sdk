kind: pip

depends:
- filename: bootstrap-import.bst
- filename: base/python3.bst
- filename: base/python3-pip.bst

variables:
  pip: pip3
  fix-pyc-timestamps: "true"

sources:
- kind: git_tag
  url: github:mesonbuild/meson.git
  track: master
  track-extra:
  - 0.50
  ref: 0.50.1-0-g2e1fca02a5a59b355dd13ff8127a906b508bde18
- kind: patch
  path: patches/meson/meson-no-lib64.patch
