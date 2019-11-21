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
  url: freedesktop:gstreamer/gst-libav.git
  track: master
  ref: 1.15.2-0-gc693e62a4464a74bace095344e355c4409d850d9
  submodules:
    common:
      checkout: True
      url: freedesktop:gstreamer/common.git
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
