kind: flatpak_image

config:
  directory: '%{libdir}'
  exclude:
  - debug

  metadata:
    Runtime:
      name: org.freedesktop.Sdk.Compat.%{flatpak_arch}

    ExtensionOf:
      ref: runtime/org.freedesktop.Sdk/%{flatpak_arch}/%{branch}

depends:
- filename: sdk-image.bst
  type: build
