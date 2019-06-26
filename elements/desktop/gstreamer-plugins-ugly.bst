kind: meson

depends:
- filename: bootstrap-import.bst
- filename: desktop/gstreamer.bst
- filename: desktop/gstreamer-plugins-base.bst
- filename: base/buildsystem-meson.bst
  type: build

sources:
- kind: git_tag
  url: freedesktop:gstreamer/gst-plugins-ugly
  track: '1.14'
  ref: 1.14.5-0-g623870567900f6a44889cb103a50af4d24121d28
  submodules:
    common:
      checkout: true
      url: freedesktop:gstreamer/common
