kind: flatpak_image

variables:
  lib: lib
  prefix: /app

config:
  directory: '%{debugdir}%{libdir}'

  metadata:
    Runtime:
      name: org.freedesktop.GlxInfo.Debug

depends:
- filename: extensions/glxinfo/mesa-demos.bst
  type: build
