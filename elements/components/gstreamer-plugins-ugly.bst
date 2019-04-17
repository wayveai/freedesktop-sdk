kind: meson

depends:
- filename: bootstrap-import.bst
- filename: components/gstreamer.bst
- filename: components/gstreamer-plugins-base.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build

sources:
- kind: git_tag
  url: freedesktop:gstreamer/gst-plugins-ugly
  track: '1.14'
  ref: 1.14.4-0-ge1bf2aa184f83ff9fd5b7850c460129100ac6d1a
  submodules:
    common:
      checkout: True
      url: freedesktop:gstreamer/common
