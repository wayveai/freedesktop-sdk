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
- kind: tar
  url: https://download.kde.org/stable/frameworks/5.60/extra-cmake-modules-5.60.0.tar.xz
  ref: 2bd9da815de98d5908d3371815df963d305c828f90ba1a076f38543876690248
