kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection.bst
- components/wayland-protocols.bst

depends:
- bootstrap-import.bst
- components/gstreamer.bst
- components/gstreamer-plugins-bad.bst
- components/libdrm.bst
- components/libva.bst
- components/wayland.bst
- components/xorg-lib-x11.bst


variables:
  meson-local: >-
    -Dwith_drm=yes
    -Dwith_encoders=yes
    -Dwith_egl=yes
    -Dwith_glx=yes
    -Dwith_wayland=yes
    -Dwith_x11=yes

sources:
- kind: git_tag
  url: freedesktop:gstreamer/gstreamer-vaapi
  track: '1.18'
  ref: 1.18.1-0-gf9e925af3645439f7b7a4580700fcd6ce17fc1c9
  submodules:
    common:
      checkout: true
      url: freedesktop:gstreamer/common
