kind: flatpak_image

depends:
  - filename: extensions/html5/ffmpeg.bst
    type: build
  - filename: extensions/html5/gstreamer-libav.bst
    type: build

config:
  directory: "%{libdir}/ffmpeg"
  
  metadata:
    Runtime:
      name: org.freedesktop.Platform.html5-codecs
      runtime: org.freedesktop.Platform/%{gcc_arch}/%{branch}
      sdk: org.freedesktop.Sdk/%{gcc_arch}/%{branch}

    ExtensionOf:
      ref: runtime/org.freedesktop.Platform/%{gcc_arch}/%{branch}
