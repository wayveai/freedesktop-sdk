kind: flatpak_image

config:
  directory: '%{datadir}/runtime/locale'

  metadata:
    Runtime:
      name: org.freedesktop.Sdk.Locale

    ExtensionOf:
      ref: runtime/org.freedesktop.Sdk/%{gcc_arch}/%{branch}

depends:
- filename: desktop-image.bst
  type: build
