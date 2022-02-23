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
  command-subdir: subprojects/gst-libav

  meson-local: >-
    '-Dc_args=-DTRIPLET=\"%{gcc_triplet}\"'
  optimize-debug: "false"

(@):
- elements/include/gstreamer-source.yml

