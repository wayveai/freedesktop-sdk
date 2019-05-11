kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/orc.bst
- filename: components/gstreamer.bst
- filename: components/gstreamer-plugins-base.bst
- filename: components/ffmpeg.bst
  type: build
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/nasm.bst
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
  ref: 1.15.2-0-gc693e62a4464a74bace095344e355c4409d850d9
  submodules:
    common:
      checkout: true
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
