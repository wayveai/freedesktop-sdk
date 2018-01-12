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
    ref: 4ce0249911fb4dda1a7e643a91490a10f2a6d415  # 1.12.13
    submodules:
      common:
        url: freedesktop:gstreamer/common
