kind: myautotools

depends:
  - filename: base.bst
    type: build
  - filename: desktop/xorg-lib-xi.bst
    type: build
  - filename: desktop/mesa.bst
    type: build
  - filename: desktop/freetype.bst
    type: build
  - filename: glxinfo/glu.bst
  - filename: glxinfo/glew.bst
  - filename: glxinfo/freeglut.bst

variables:
  prefix: /app
  lib: lib

environment:
  PKG_CONFIG_PATH: "/app/lib/pkgconfig:"
  CPPFLAGS: "-O2 -D_FORTIFY_SOURCE=2 -I/app/include"
  LDFLAGS: "-fstack-protector-strong -Wl,-z,relro,-z,now -L/app/lib"

sources:
  - kind: tar
    url: https://mesa.freedesktop.org/archive/demos/8.3.0/mesa-demos-8.3.0.tar.bz2
    ref: c173154bbd0d5fb53d732471984def42fb1b14ac85fcb834138fb9518b3e0bef
