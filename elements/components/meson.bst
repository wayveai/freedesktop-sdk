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
  track: '0.57'
  ref: 0.57.1-0-g7182685b2241e88340b6c3340afba59a26be213f
- kind: patch
  path: patches/meson/meson-no-lib64.patch
