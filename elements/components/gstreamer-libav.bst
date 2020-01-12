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
  ref: 1.16.2-0-g090cfd40aad49ad645a9bf4bdd62e65b739c95f3
  submodules:
    common:
      checkout: false
      url: freedesktop:gstreamer/common.git
- kind: patch
  path: patches/gstreamer-libav/gst-libav-stop-caching-codecs.patch
