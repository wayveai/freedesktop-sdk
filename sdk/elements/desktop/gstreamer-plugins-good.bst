kind: autotools

depends:
  - filename: base.bst
    type: build
  - filename: desktop/orc.bst
  - filename: desktop/gstreamer.bst
  - filename: desktop/gstreamer-plugins-base.bst

variables:
  conf-local: |
      --enable-experimental \
      --enable-orc \
      --disable-monoscope \
      --disable-aalib \
      --enable-cairo \
      --disable-libcaca \
      --disable-jack \
      --with-default-visualizer=autoaudiosink

sources:
  - kind: git
    url: freedesktop:gstreamer/gst-plugins-good
    track: 1.12
    ref: 224938300a3b0fd8263422c3548576ac939032e5  # 1.12.14
    submodules:
      common:
        url: freedesktop:gstreamer/common
