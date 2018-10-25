kind: meson

depends:
- filename: bootstrap-import.bst
- filename: desktop/gstreamer.bst
- filename: desktop/gstreamer-plugins-base.bst
- filename: base/buildsystem-meson.bst
  type: build

sources:
- kind: git
  url: freedesktop-old:gstreamer/gst-plugins-ugly
  track: 1.14
  ref: b39a47777f899b4c3aea16d03aec80d7f0e56539   # 1.14.2
  submodules:
    common:
      url: freedesktop-old:gstreamer/common
