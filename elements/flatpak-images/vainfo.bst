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
      name: org.freedesktop.Platform.VaInfo
      runtime: org.freedesktop.Platform/%{flatpak_arch}/%{branch}
      sdk: org.freedesktop.Sdk/%{flatpak_arch}/%{branch}
      command: vainfo

    Context:
      shared: "ipc;"
      sockets: "x11;wayland;"
      devices: "dri;"

    Extension org.freedesktop.Platform.VaInfo.Debug:
      directory: lib/debug
      autodelete: 'true'
      no-autodownload: 'true'

depends:
- filename: extensions/vainfo/libva-utils.bst
  type: build
