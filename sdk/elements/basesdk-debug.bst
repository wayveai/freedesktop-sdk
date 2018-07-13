kind: flatpak_image

config:
  directory: "%{debugdir}"

  metadata:
    Runtime:
      name: org.freedesktop.BaseSdk.Debug

    ExtensionOf:
      ref: runtime/org.freedesktop.BaseSdk/%{gcc_arch}/%{branch}

depends:
  - filename: base-image.bst
    type: build
