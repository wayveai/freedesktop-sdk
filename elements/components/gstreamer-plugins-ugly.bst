kind: meson

depends:
- filename: bootstrap-import.bst
- filename: components/gstreamer.bst
- filename: components/gstreamer-plugins-base.bst
- filename: components/orc.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build

variables:
  meson-local: >-
    -Dauto_features=disabled
    -Dasfdemux=enabled
    -Ddvdlpcmdec=enabled
    -Ddvdsub=enabled
    -Drealmedia=enabled
    -Dxingmux=enabled
    -Dorc=enabled
    -Dpackage-origin="freedesktop-sdk"

sources:
- kind: git_tag
  url: freedesktop:gstreamer/gst-plugins-ugly.git
  track: '1.16'
  ref: 1.16.3-0-gf25c41970a54590e9f6fc82406aeda377864f8d8
  submodules:
    common:
      checkout: false
      url: freedesktop:gstreamer/common.git
