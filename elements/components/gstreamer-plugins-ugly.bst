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
  match:
  - 1.*[02468].*
  ref: 1.18.6-0-g8f97a05e1d2cb3cd2548cde2e70ea6d335040f59
