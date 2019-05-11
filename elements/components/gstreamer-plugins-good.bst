kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/cairo.bst
- filename: components/orc.bst
- filename: components/lame.bst
- filename: components/libpulse.bst
- filename: components/libsoup.bst
- filename: components/mpg123.bst
- filename: components/gtk3.bst
- filename: components/gdk-pixbuf.bst
- filename: components/gstreamer.bst
- filename: components/gstreamer-plugins-base.bst
- filename: components/gobject-introspection.bst
  type: build
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/libflac.bst
- filename: components/wavpack.bst

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
  url: freedesktop:gstreamer/gst-plugins-good
  track: '1.14'
  ref: 1.14.4-0-gd88d1b0e43b140587f35c7c9bf390fae051e427d
  submodules:
    common:
      checkout: true
      url: freedesktop:gstreamer/common
