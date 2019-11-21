kind: meson

depends:
- filename: bootstrap-import.bst
- filename: components/orc.bst
- filename: components/gstreamer.bst
- filename: components/gstreamer-plugins-base.bst
- filename: components/ffmpeg.bst
  type: build
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/nasm.bst
  type: build

variables:
  meson-local: |
    '-Dc_args=-DTRIPLET=\"%{gcc_triplet}\"'

sources:
- kind: git_tag
  url: freedesktop:gstreamer/gst-libav.git
  track: '1.16'
  ref: 1.16.1-0-gfe08c26641592f058b6fa0da9a1f86fc0b24cb0c
  submodules:
    common:
      checkout: false
      url: freedesktop:gstreamer/common.git
- kind: patch
  path: patches/gstreamer-libav/gst-libav-stop-caching-codecs.patch
