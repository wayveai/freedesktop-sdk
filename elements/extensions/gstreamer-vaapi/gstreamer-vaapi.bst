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
  command-subdir: subprojects/gstreamer-vaapi

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

(@):
- elements/include/gstreamer-source.yml
