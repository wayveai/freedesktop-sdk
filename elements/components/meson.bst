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
  - '0.53'
  ref: 0.53.2-0-g156e066199bcc44523edec43b4f98a56a5de3a29
- kind: patch
  path: patches/meson/meson-no-lib64.patch
