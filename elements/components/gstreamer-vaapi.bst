kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/gobject-introspection.bst
  type: build
- filename: components/gstreamer.bst
- filename: components/gstreamer-plugins-bad.bst
- filename: components/libdrm.bst
- filename: components/libva.bst
- filename: components/wayland.bst
- filename: components/wayland-protocols.bst
  type: build
- filename: components/xorg-lib-x11.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/gettext.bst
  type: build
- filename: components/which.bst
  type: build


variables:
  conf-local: |
    --enable-encoders \
    --enable-egl \
    --enable-glx \
    --enable-drm \
    --enable-wayland \
    --enable-x11

sources:
- kind: git_tag
  url: freedesktop:gstreamer/gstreamer-vaapi
  track: '1.14'
  ref: 1.14.4-0-g8b1b1f44bda266830f2f28adbb95720f3bc3433f
  submodules:
    common:
      checkout: True
      url: freedesktop:gstreamer/common
