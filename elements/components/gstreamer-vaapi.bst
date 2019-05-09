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
  track: '1.16'
  ref: 1.16.0-0-g2c3480796a6673c638f5b12c7bdf5c0f191120fd
  submodules:
    common:
      checkout: true
      url: freedesktop:gstreamer/common
- kind: patch
  path: patches/gstreamer-vaapi/disable-gallium-driver.patch
