kind: autotools
description: gstreamer-libav rebuild with html5-codecs

(@):
  - elements/config/gstreamer-libav.yml

depends:
  (>):
    - filename: extensions/html5/ffmpeg.bst
      type: build

environment:
  PKG_CONFIG_PATH: $(PKG_CONFIG_PATH):%{libdir}/ffmpeg/lib/pkgconfig
