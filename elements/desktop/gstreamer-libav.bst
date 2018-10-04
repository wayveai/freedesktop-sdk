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
  - kind: git
    url: freedesktop-old:gstreamer/gst-libav
    track: master
    # Latest stable release doesn't support our ffmpeg, this is the closest commit
    # to 1.14.2 which supports ffmpeg n4.0.2 with minimal patching
    ref: 3b6597188ad25cca84ae5caa7b08767a5b4cfee7 # 1.14.0-39-g3b65971
    submodules:
      common:
        url: freedesktop-old:gstreamer/common
      gst-libs/ext/libav:
        url: https://git.ffmpeg.org/ffmpeg.git
      gst-libs/ext/gas-preprocessor:
        url: git://git.libav.org/gas-preprocessor.git
  - kind: patch
    path: patches/gst-libav-stop-caching-codecs.patch
  - kind: patch
    path: patches/gst-libav-fix-api.patch
