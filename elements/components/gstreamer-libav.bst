kind: meson

build-depends:
- components/ffmpeg.bst
- public-stacks/buildsystem-meson.bst
- components/nasm.bst
- components/hotdoc.bst

depends:
- bootstrap-import.bst
- components/orc.bst
- components/gstreamer.bst
- components/gstreamer-plugins-base.bst

variables:
  meson-local: |
    '-Dc_args=-DTRIPLET=\"%{gcc_triplet}\"'
  optimize-debug: "false"

sources:
- kind: git_tag
  url: freedesktop:gstreamer/gst-libav.git
  track: master
  track-extra:
  - '1.18'
  ref: 1.18.3-0-g67fc1e5c6c5e578dce250ae6310de71a0f5f8ec3
  submodules:
    common:
      checkout: false
      url: freedesktop:gstreamer/common.git
- kind: patch
  path: patches/gstreamer-libav/gst-libav-stop-caching-codecs.patch
