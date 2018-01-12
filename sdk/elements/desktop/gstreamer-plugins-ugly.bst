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
    ref: ffbf076dd13783786d7c7147b4d909af52f7b341  # 1.12.3
    submodules:
      common:
        url: freedesktop:gstreamer/common
