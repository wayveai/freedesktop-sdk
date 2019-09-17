kind: cmake

(@): elements/extensions/include/app.yml

depends:
- filename: components/xorg-lib-xi.bst
  type: build
- filename: components/mesa-headers.bst
  type: build
- filename: extensions/glxinfo/glu.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build

variables:
  cmake-local: |
    -DFREEGLUT_BUILD_DEMOS:BOOL=OFF \
    -DCMAKE_C_FLAGS="${CFLAGS} -I/app/include"

sources:
- kind: tar
  url: https://prdownloads.sourceforge.net/freeglut/freeglut-3.0.0.tar.gz
  ref: 2a43be8515b01ea82bcfa17d29ae0d40bd128342f0930cd1f375f1ff999f76a2
