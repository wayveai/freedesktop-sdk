kind: flatpak_image

variables:
  lib: lib
  prefix: /app

config:
  directory: '%{debugdir}%{libdir}'

  metadata:
    Runtime:
      name: org.freedesktop.VaInfo.Debug

depends:
- filename: extensions/vainfo/libva-utils.bst
  type: build
