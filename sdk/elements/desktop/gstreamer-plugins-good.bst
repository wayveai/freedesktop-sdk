kind: myautotools

depends:
  - filename: base-stack.bst
  - filename: desktop/orc.bst
  - filename: desktop/gstreamer.bst
  - filename: desktop/gstreamer-plugins-base.bst

variables:
  conf-extra: |
      --enable-experimental \
      --enable-orc \
      --disable-monoscope \
      --disable-aalib \
      --enable-cairo \
      --disable-libcaca \
      --disable-jack \
      --with-default-visualizer=autoaudiosink

sources:
  - kind: tar
    url: https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.12.3.tar.xz
    ref: 13e7f479296891fef5a686438f20ba7d534680becf2269ecc5ee24aa83b45f03
