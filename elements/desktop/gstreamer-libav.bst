kind: autotools
description: gstreamer-libav shipped in Platform, not rebuilt on patented codecs

(@):
  - elements/config/gstreamer-libav.yml

depends:
  (>):
    - filename: desktop/ffmpeg.bst
      type: build
