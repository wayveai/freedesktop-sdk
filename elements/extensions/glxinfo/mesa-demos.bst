kind: autotools

depends:
- filename: desktop/xorg-lib-xi.bst
  type: build
- filename: desktop/mesa.bst
  type: build
- filename: desktop/freetype.bst
  type: build
- filename: base/buildsystem-autotools.bst
  type: build
- filename: extensions/glxinfo/glu.bst
- filename: extensions/glxinfo/glew.bst
- filename: extensions/glxinfo/freeglut.bst

variables:
  prefix: /app
  lib: lib

environment:
  PKG_CONFIG_PATH: '/app/lib/pkgconfig:'

sources:
- kind: git_tag
  url: freedesktop:mesa/demos.git
  track: master
  ref: mesa-demos-8.4.0-0-g317f67fe5e75c685330d536f158acf6260b473d1
