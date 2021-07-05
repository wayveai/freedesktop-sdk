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
    -Ddoc=disabled
    -Dtests=disabled
    -Dexamples=disabled

sources:
- kind: git_tag
  url: freedesktop:gstreamer/gstreamer-vaapi
  track: '1.18'
  match:
  - 1.*[02468].*
  ref: 1.18.4-0-gb5b2e3b9208f1f93bc5b0244d29dfed157d78293
  submodules:
    common:
      checkout: true
      url: freedesktop:gstreamer/common