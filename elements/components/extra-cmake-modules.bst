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
  ref: v5.92.0-0-gd18d5f38650dc41f801773823bff63ea73694a2f
