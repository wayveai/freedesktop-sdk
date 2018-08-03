kind: flatpak_image

config:
  directory: "%{datadir}/runtime/docs"

  metadata:
    Runtime:
      name: org.freedesktop.BaseSdk.Docs

    ExtensionOf:
      ref: "runtime/org.freedesktop.BaseSdk/%{gcc_arch}/%{branch}"

depends:
  - filename: base-image.bst
    type: build
