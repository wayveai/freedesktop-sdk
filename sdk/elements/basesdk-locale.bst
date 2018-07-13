kind: flatpak_image

config:
  directory: "%{datadir}/runtime/locale"

  metadata:
    Runtime:
      name: org.freedesktop.BaseSdk.Locale

    ExtensionOf:
      ref: "runtime/org.freedesktop.BaseSdk/%{gcc_arch}/%{branch}"

depends:
  - filename: base-image.bst
    type: build
