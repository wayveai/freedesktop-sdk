kind: flatpak_image

config:
  directory: '%{libdir}'
  exclude:
  - debug

  metadata:
    Runtime:
      name: org.freedesktop.Platform.Compat.%{gcc_arch}

    ExtensionOf:
      ref: runtime/org.freedesktop.Platform/%{gcc_arch}/%{branch}

depends:
- filename: desktop-platform-image.bst
  type: build
