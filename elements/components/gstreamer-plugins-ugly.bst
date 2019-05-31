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
  track: '1.16'
  ref: 1.16.0-0-g6cbac8d09f7866827381a9d0554b7a61d45b41b5
  submodules:
    common:
      checkout: true
      url: freedesktop:gstreamer/common
