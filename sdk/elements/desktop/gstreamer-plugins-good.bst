kind: meson

depends:
  - filename: desktop/orc.bst
  - filename: desktop/gstreamer.bst
  - filename: desktop/gstreamer-plugins-base.bst
  - filename: base/meson.bst
    type: build
  - filename: base/ninja.bst
    type: build
  - filename: base/pkg-config.bst
    type: build

variables:
  meson-local: |
    -Duse_orc=yes

sources:
  - kind: git
    url: freedesktop:gstreamer/gst-plugins-good
    track: 1.14
    ref: 6854a23b5497543db3c8c8f26cb9762cc7aa0750 # 1.14.0
    submodules:
      common:
        url: freedesktop:gstreamer/common
