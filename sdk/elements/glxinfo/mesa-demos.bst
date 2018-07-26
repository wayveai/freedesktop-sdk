kind: autotools

depends:
  - filename: desktop/xorg-lib-xi.bst
    type: build
  - filename: desktop/mesa.bst
    type: build
  - filename: desktop/freetype.bst
    type: build
  - filename: base/pkg-config.bst
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
    url: https://mesa.freedesktop.org/archive/demos/mesa-demos-8.4.0.tar.gz
    ref: b997fe1a07584fdc9f25fc9807ea9fd8df15032d6cf1631aa3ba69f8fe09d633
