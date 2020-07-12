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
  cmake-local: >
    -DFREEGLUT_BUILD_DEMOS:BOOL=OFF
    -DCMAKE_C_FLAGS="${CFLAGS} -I/app/include"

  local_flags: -fcommon

sources:
- kind: tar
  url: tar_https:prdownloads.sourceforge.net/freeglut/freeglut-3.2.1.tar.gz
  ref: d4000e02102acaf259998c870e25214739d1f16f67f99cb35e4f46841399da68
