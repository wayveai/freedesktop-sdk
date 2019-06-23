kind: flatpak_image

config:
  directory: '%{debugdir}%{libdir}'
  include:
  - debug

  metadata:
    Runtime:
      name: org.freedesktop.Platform.Compat.%{flatpak_arch}.Debug

    ExtensionOf:
      ref: runtime/org.freedesktop.Platform/%{flatpak_arch}/%{branch}

depends:
- filename: platform-image.bst
  type: build
