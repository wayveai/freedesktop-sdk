kind: flatpak_image

config:
  directory: '%{datadir}/runtime/docs'

  metadata:
    Runtime:
      name: org.freedesktop.Sdk.Docs

    ExtensionOf:
      ref: runtime/org.freedesktop.Sdk/%{gcc_arch}/%{branch}

depends:
- filename: desktop-image.bst
  type: build
