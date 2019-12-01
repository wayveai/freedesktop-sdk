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
    -Dpackage-origin="freedesktop-sdk"
    -Dv4l2-libv4l2=disabled
    -Dv4l2-gudev=disabled
    -Daalib=disabled
    -Djack=disabled
    -Dlibcaca=disabled
    -Ddv=disabled
    -Ddv1394=disabled
    -Dqt5=disabled
    -Dshout2=disabled
    -Dtaglib=disabled
    -Dtwolame=disabled
    -Dexamples=disabled

sources:
- kind: git_tag
  url: freedesktop:gstreamer/gst-plugins-good.git
  track: '1.16'
  ref: 1.16.1-0-gd7d290b64c1282398f3265522a33e093b7233310
  submodules:
    common:
      checkout: false
      url: freedesktop:gstreamer/common.git
