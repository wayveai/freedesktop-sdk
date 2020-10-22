kind: meson

build-depends:
- components/gobject-introspection.bst
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst
- components/cairo.bst
- components/jpeg.bst
- components/orc.bst
- components/lame.bst
- components/libpng.bst
- components/libpulse.bst
- components/libsoup.bst
- components/libvpx.bst
- components/mpg123.bst
- components/gtk3.bst
- components/gdk-pixbuf.bst
- components/gstreamer.bst
- components/gstreamer-plugins-base.bst
- components/libflac.bst
- components/speex.bst
- components/wavpack.bst
- components/v4l-utils.bst

variables:
  meson-local: >-
    -Dpackage-origin="freedesktop-sdk"
    -Dv4l2-libv4l2=enabled
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
  ref: 1.16.3-0-g2bec35e0804e83e874d2db5ea7f7d440687a5275
  submodules:
    common:
      checkout: false
      url: freedesktop:gstreamer/common.git
