kind: flatpak_image

build-depends:
- extensions/gstreamer-vaapi/extension.bst

config:
  directory: '%{libdir}/gstreamer-1.0'

  metadata:
    Runtime:
      name: org.freedesktop.Platform.GStreamer.gstreamer-vaapi
      runtime: org.freedesktop.Platform/%{flatpak_arch}/%{branch}
      sdk: org.freedesktop.Sdk/%{flatpak_arch}/%{branch}

    ExtensionOf:
      ref: runtime/org.freedesktop.Platform/%{flatpak_arch}/%{branch}
