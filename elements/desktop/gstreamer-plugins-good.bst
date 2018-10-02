kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: desktop/cairo.bst
  - filename: desktop/orc.bst
  - filename: desktop/lame.bst
  - filename: desktop/libpulse.bst
  - filename: desktop/libsoup.bst
  - filename: desktop/mpg123.bst
  - filename: desktop/gstreamer.bst
  - filename: desktop/gstreamer-plugins-base.bst
  - filename: desktop/gobject-introspection.bst
    type: build
  - filename: base/buildsystem-autotools.bst
    type: build
  - filename: base/libflac.bst
  - filename: base/wavpack.bst
  - filename: base/which.bst
    type: build

variables:
  conf-local: |
    --enable-cairo \
    --enable-experimental \
    --enable-introspection \
    --enable-lame \
    --enable-soup \
    --enable-orc \
    --enable-pulse \
    --with-default-visualizer=autoaudiosink

sources:
  - kind: git
    url: freedesktop-old:gstreamer/gst-plugins-good
    track: 1.14
    ref: a0f3d00302fe733ccbc6f308799dd53a109537b7 # 1.14.2
    submodules:
      common:
        url: freedesktop-old:gstreamer/common
