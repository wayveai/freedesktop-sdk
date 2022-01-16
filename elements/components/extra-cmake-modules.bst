kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build

variables:
  cmake-local: |
    -DBUILD_TESTING:BOOL=OFF \
    -DBUILD_HTML_DOCS:BOOL=OFF \
    -DBUILD_MAN_DOCS:BOOL=OFF \
    -DBUILD_QTHELP_DOCS:BOOL=OFF

sources:
- kind: git_tag
  url: github:KDE/extra-cmake-modules.git
  track: master
  exclude:
  - '*rc*'
  ref: v5.90.0-0-g29a243a9c12e1f9fdcabcae7fb8c4ab091d1ed68
