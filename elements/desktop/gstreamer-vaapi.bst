kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: desktop/gobject-introspection.bst
  type: build
- filename: desktop/gstreamer.bst
- filename: desktop/gstreamer-plugins-bad.bst
- filename: desktop/libdrm.bst
- filename: desktop/libva.bst
- filename: desktop/mesa.bst
- filename: desktop/wayland.bst
- filename: desktop/wayland-protocols.bst
  type: build
- filename: desktop/xorg-lib-x11.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/gettext.bst
  type: build
- filename: base/which.bst
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
  ref: 1.14.5-0-gfb69a2efd26ff719765203fd634db4c4361db30a
  submodules:
    common:
      checkout: true
      url: freedesktop:gstreamer/common
