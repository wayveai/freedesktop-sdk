kind: flatpak_image

variables:
  prefix: /app

config:
  directory: "%{prefix}"

  metadata:
    Application:
      name: org.freedesktop.VulkanInfo
      runtime: org.freedesktop.Platform/%{gcc_arch}/%{branch}
      sdk: org.freedesktop.Sdk/%{gcc_arch}/%{branch}
      command: vulkaninfo

    Context:
      shared: "ipc;"
      sockets: "x11;wayland;"
      devices: "dri;"

depends:
  - filename: extensions/vulkaninfo/vulkan-tools.bst
    type: build
