kind: flatpak_image

variables:
  prefix: /app

config:
  directory: "%{prefix}"
  
  metadata:
    Application:
      name: org.freedesktop.ClInfo
      runtime: org.freedesktop.Platform/%{gcc_arch}/%{branch}
      sdk: org.freedesktop.Sdk/%{gcc_arch}/%{branch}
      command: clinfo

    Context:
      shared: "ipc;"
      sockets: "x11;wayland;"
      devices: "dri;"

depends:
  - filename: extensions/clinfo/clinfo.bst
    type: build
