kind: flatpak_image

config:
  directory: '%{libdir}'
  exclude:
  - debug

  metadata:
    Runtime:
      name: org.freedesktop.Sdk.Compat.%{gcc_arch}

    ExtensionOf:
      ref: runtime/org.freedesktop.Sdk/%{gcc_arch}/%{branch}

depends:
- filename: sdk-image.bst
  type: build
