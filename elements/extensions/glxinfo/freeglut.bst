kind: cmake

(@): elements/extensions/include/app.yml

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/mesa-headers.bst
- components/xorg-lib-xi.bst

- extensions/glxinfo/glu.bst


variables:
  cmake-local: >
    -DFREEGLUT_BUILD_DEMOS:BOOL=OFF
    -DCMAKE_C_FLAGS="${CFLAGS} -I/app/include"

  local_flags: -fcommon

sources:
- kind: git_tag
  url: github:FreeGLUTProject/freeglut.git
  track: master
  ref: v3.2.2-0-ge3aa3d74f3c6a93b26fd66f81152d9c55506a6c6
