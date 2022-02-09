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
  match:
  - 1.*[02468].*
  ref: 1.18.6-0-g9b31c42bebe36e4f88b2b6f1bd4f98f62708d793
- kind: patch
  path: patches/gstreamer-libav/gst-libav-stop-caching-codecs.patch
