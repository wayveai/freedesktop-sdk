kind: flatpak_image

depends:
- filename: extensions/ffmpeg-full/ffmpeg.bst
  type: build

config:
  directory: '%{libdir}/ffmpeg/lib'
  metadata:
    Runtime:
      name: org.freedesktop.Platform.ffmpeg-full

    ExtensionOf:
      ref: runtime/org.freedesktop.Platform/%{gcc_arch}/%{branch}
