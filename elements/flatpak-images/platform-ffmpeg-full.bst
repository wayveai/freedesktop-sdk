kind: flatpak_image

build-depends:
- extensions/ffmpeg-full/ffmpeg.bst
- extensions/ffmpeg-full/appdata.bst

config:
  directory: '%{libdir}/ffmpeg/lib'
  metadata:
    Runtime:
      name: org.freedesktop.Platform.ffmpeg-full

    ExtensionOf:
      ref: runtime/org.freedesktop.Platform/%{gcc_arch}/%{branch}
