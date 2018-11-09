kind: pip

depends:
- filename: bootstrap-import.bst
- filename: base/python3.bst

variables:
  pip: pip3

sources:
- kind: git_tag
  url: github:mesonbuild/meson.git
  track: master
  ref: 6aef9d32a40cf1639f4df29f141b9bb461c52dea    # 0.48.1
- kind: patch
  path: patches/meson-no-lib64.patch
