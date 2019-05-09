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
  track: '1.16'
  ref: 1.16.0-0-g646dc1ef9b92841e235d10a8262882b6e7d97422
  submodules:
    common:
      checkout: true
      url: freedesktop:gstreamer/common
