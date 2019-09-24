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
  url: freedesktop:gstreamer/gst-libav
  track: '1.16'
  ref: 1.16.0-0-gd6c61e69b36eaa144a5ef8fdac73a8162f072509
  submodules:
    common:
      checkout: false
      url: freedesktop:gstreamer/common
- kind: patch
  path: patches/gstreamer-libav/gst-libav-stop-caching-codecs.patch
