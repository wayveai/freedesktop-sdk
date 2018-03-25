kind: meson

depends:
  - filename: base.bst
    type: build
  - filename: desktop/gstreamer.bst
  - filename: desktop/gstreamer-plugins-base.bst

sources:
  - kind: git
    url: freedesktop:gstreamer/gst-plugins-ugly
    track: 1.14
    ref: 3d6b928e1754abead08255918f134c16f5a70d30 # 1.14.0
    submodules:
      common:
        url: freedesktop:gstreamer/common
