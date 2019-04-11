kind: flatpak_image

depends:
- filename: extensions/ffmpeg-html5/ffmpeg.bst
  type: build

config:
  directory: '%{libdir}/ffmpeg'
  metadata:
    Runtime:
      name: org.freedesktop.Platform.ffmpeg-html5
      runtime: org.freedesktop.Platform/%{gcc_arch}/%{branch}
      sdk: org.freedesktop.Sdk/%{gcc_arch}/%{branch}

    ExtensionOf:
      ref: runtime/org.freedesktop.Platform/%{gcc_arch}/%{branch}
