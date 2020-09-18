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

sources:
- kind: git_tag
  url: freedesktop:gstreamer/gst-libav.git
  track: master
  track-extra:
  - '1.18'
  ref: 1.18.0-0-g215b3ed959f2b307065319f94855cc9e1ce7be95
  submodules:
    common:
      checkout: false
      url: freedesktop:gstreamer/common.git
- kind: patch
  path: patches/gstreamer-libav/gst-libav-stop-caching-codecs.patch
