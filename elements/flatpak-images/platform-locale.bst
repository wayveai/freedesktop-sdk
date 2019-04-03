kind: flatpak_image

config:
  directory: '%{datadir}/runtime/locale'

  metadata:
    Runtime:
      name: org.freedesktop.Platform.Locale

    ExtensionOf:
      ref: runtime/org.freedesktop.Platform/%{gcc_arch}/%{branch}

depends:
- filename: desktop-platform-image.bst
  type: build
