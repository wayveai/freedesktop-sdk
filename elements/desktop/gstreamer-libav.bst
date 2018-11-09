kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: desktop/orc.bst
- filename: desktop/gstreamer.bst
- filename: desktop/gstreamer-plugins-base.bst
- filename: desktop/ffmpeg.bst
  type: build
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/which.bst
  type: build
- filename: base/nasm.bst
  type: build

variables:
  conf-local: |
    --with-system-libav

sources:
- kind: git_tag
  url: freedesktop:gstreamer/gst-libav
  track: master
  # Snapshot used by debian so we can use their patches
  ref: 1.14.0-54-gdb8235024523a0375443f36eb5fec627386452d5
  submodules:
    common:
      url: freedesktop:gstreamer/common
    gst-libs/ext/libav:
      url: https://git.ffmpeg.org/ffmpeg.git
    gst-libs/ext/gas-preprocessor:
      url: git://git.libav.org/gas-preprocessor.git
- kind: patch
  path: patches/gst-libav-stop-caching-codecs.patch
- kind: patch
  path: patches/gst-libav-disable-1.15-api.patch
- kind: patch
  path: patches/gst-libav-drop-1.15-dependency.patch
- kind: patch
  path: patches/gst-libav-avmux-Place-pva-case-after-generic-case.patch
- kind: patch
  path: patches/gst-libav-decoders-fix-draining.patch
