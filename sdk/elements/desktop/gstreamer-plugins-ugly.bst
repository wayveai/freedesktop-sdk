kind: autotools

depends:
  - filename: base.bst
    type: build
  - filename: desktop/gstreamer.bst
  - filename: desktop/gstreamer-plugins-base.bst

variables:
  conf-local: |
      --disable-asfdemux \
      --disable-dvdlpcmdec \
      --disable-dvdsub \
      --disable-xingmux \
      --disable-realmedia

sources:
  - kind: git
    url: freedesktop:gstreamer/gst-plugins-ugly
    track: 1.12
    ref: 46fab99f2ef5581d63c2d11c57fb741553ede37f  # 1.12.4
    submodules:
      common:
        url: freedesktop:gstreamer/common
