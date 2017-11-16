kind: flatpak-image

config:
  directory: "%{debugdir}%{libdir}"

  metadata:
    Runtime:
      name: org.freedesktop.Platform.Compat.%{gcc_arch}.Debug

    ExtensionOf:
      ref: runtime/org.freedesktop.Platform/%{gcc_arch}/%{branch}

depends:
  - filename: desktop-platform-image.bst
    type: build
