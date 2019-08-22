kind: flatpak_image

depends:
- filename: extensions/ffmpeg-html5/ffmpeg.bst
  type: build

config:
  directory: '%{libdir}/ffmpeg/lib'
  metadata:
    Runtime:
      name: org.freedesktop.Platform.ffmpeg-html5
      runtime: org.freedesktop.Platform/%{flatpak_arch}/%{branch}
      sdk: org.freedesktop.Sdk/%{flatpak_arch}/%{branch}

    ExtensionOf:
      ref: runtime/org.freedesktop.Platform/%{flatpak_arch}/%{branch}
