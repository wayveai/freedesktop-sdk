kind: flatpak_image

config:
  directory: "%{datadir}/runtime/locale"

  metadata:
    Runtime:
      name: org.freedesktop.BasePlatform.Locale

    ExtensionOf:
      ref: "runtime/org.freedesktop.BasePlatform/%{gcc_arch}/%{branch}"

depends:
  - filename: base-platform-image.bst
    type: build
