kind: flatpak_image

config:
  directory: '%{debugdir}'

  metadata:
    Runtime:
      name: org.freedesktop.Sdk.Debug

    ExtensionOf:
      ref: runtime/org.freedesktop.Sdk/%{gcc_arch}/%{branch}

depends:
- filename: desktop-image.bst
  type: build
