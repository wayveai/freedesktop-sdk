kind: meson

depends:
- filename: bootstrap-import.bst
- filename: components/cairo.bst
- filename: components/jpeg.bst
- filename: components/orc.bst
- filename: components/lame.bst
- filename: components/libpng.bst
- filename: components/libpulse.bst
- filename: components/libsoup.bst
- filename: components/libvpx.bst
- filename: components/mpg123.bst
- filename: components/gtk3.bst
- filename: components/gdk-pixbuf.bst
- filename: components/gstreamer.bst
- filename: components/gstreamer-plugins-base.bst
- filename: components/gobject-introspection.bst
  type: build
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/libflac.bst
- filename: components/speex.bst
- filename: components/wavpack.bst

variables:
  meson-local: >-
    -Dbz2=enabled
    -Dcairo=enabled
    -Dflac=enabled
    -Dgdk-pixbuf=enabled
    -Dgtk3=enabled
    -Dintrospection=enabled
    -Djpeg=enabled
    -Dlame=enabled
    -Dmpg123=enabled
    -Dorc=enabled
    -Dpackage-origin="freedesktop-sdk"
    -Dpng=enabled
    -Dpulse=enabled
    -Dsoup=enabled
    -Dspeex=enabled
    -Dvpx=enabled
    -Dwavpack=enabled

sources:
- kind: git_tag
  url: freedesktop:gstreamer/gst-plugins-good
  track: '1.16'
  ref: 1.16.0-0-g646dc1ef9b92841e235d10a8262882b6e7d97422
  submodules:
    common:
      checkout: true
      url: freedesktop:gstreamer/common
