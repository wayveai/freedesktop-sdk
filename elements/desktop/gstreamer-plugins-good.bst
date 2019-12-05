kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: desktop/cairo.bst
- filename: desktop/orc.bst
- filename: desktop/lame.bst
- filename: desktop/libpulse.bst
- filename: desktop/libsoup.bst
- filename: desktop/mpg123.bst
- filename: desktop/gtk3.bst
- filename: desktop/gdk-pixbuf.bst
- filename: desktop/gstreamer.bst
- filename: desktop/gstreamer-plugins-base.bst
- filename: desktop/gobject-introspection.bst
- filename: base/libvpx.bst
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
- kind: git_tag
  url: freedesktop:gstreamer/gst-plugins-good.git
  track: '1.14'
  ref: 1.14.4-0-gd88d1b0e43b140587f35c7c9bf390fae051e427d
  submodules:
    common:
      checkout: True
      url: freedesktop:gstreamer/common.git
