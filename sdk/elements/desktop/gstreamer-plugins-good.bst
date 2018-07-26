kind: meson

depends:
  - filename: bootstrap-import.bst
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
    track: 1.14.2
    ref: a0f3d00302fe733ccbc6f308799dd53a109537b7 # 1.14.2
    submodules:
      common:
        url: freedesktop:gstreamer/common
