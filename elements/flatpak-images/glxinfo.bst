kind: flatpak_image

variables:
  lib: lib
  prefix: /app

config:
  directory: '%{prefix}'
  exclude:
  - debug
  - devel

  metadata:
    Application:
      name: org.freedesktop.GlxInfo
      runtime: org.freedesktop.Platform/%{flatpak_arch}/%{branch}
      sdk: org.freedesktop.Sdk/%{flatpak_arch}/%{branch}
      command: glxinfo

    Context:
      shared: ipc;
      sockets: x11;wayland;
      devices: dri;

    Extension org.freedesktop.GlxInfo.Debug:
      directory: lib/debug
      autodelete: 'true'
      no-autodownload: 'true'

depends:
- filename: extensions/glxinfo/mesa-demos.bst
  type: build
