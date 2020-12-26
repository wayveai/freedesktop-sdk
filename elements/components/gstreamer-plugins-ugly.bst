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
  track: master
  track-extra:
  - '1.18'
  ref: 1.18.2-0-g45c7522506ff49fcde0933c65c1eba48e1df7500
  submodules:
    common:
      checkout: false
      url: freedesktop:gstreamer/common.git
