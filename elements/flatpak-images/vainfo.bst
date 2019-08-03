kind: flatpak_image

variables:
  prefix: /app

config:
  directory: "%{prefix}"

  metadata:
    Application:
      name: org.freedesktop.VaInfo
      runtime: org.freedesktop.Platform/%{flatpak_arch}/%{branch}
      sdk: org.freedesktop.Sdk/%{flatpak_arch}/%{branch}
      command: vainfo

    Context:
      shared: "ipc;"
      sockets: "x11;wayland;"
      devices: "dri;"

depends:
  - filename: extensions/vainfo/libva-utils.bst
    type: build
