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

environment:
  GST_CFLAGS: -DTRIPLET=\"%{gcc_triplet}\"

sources:
- kind: git_tag
  url: freedesktop:gstreamer/gst-libav
  track: master
  # Snapshot used by debian so we can use their patches
  ref: 1.15.1-0-g240cb809a97d3e636460ef839d6e2db23fe6565e
  submodules:
    common:
      checkout: True
      url: freedesktop:gstreamer/common
- kind: patch
  path: patches/gstreamer-libav/gst-libav-stop-caching-codecs.patch
- kind: patch
  path: patches/gstreamer-libav/gst-libav-disable-1.15-api.patch
- kind: patch
  path: patches/gstreamer-libav/gst-libav-drop-1.15-dependency.patch
- kind: patch
  path: patches/gstreamer-libav/gst-libav-Revert-incompatible-commit.patch
- kind: patch
  path: patches/gstreamer-libav/gst-libav-plugin-dependencies.patch
