kind: meson

build-depends:
- bootstrap-import.bst
- public-stacks/buildsystem-meson.bst
- components/wayland-protocols.bst
- extensions/mesa/libdrm.bst

depends:
- components/libunwind-maybe.bst
- components/linux-pam.bst
- components/cairo.bst
- components/colord.bst
- components/libdrm.bst
- components/wayland.bst
- components/systemd.bst
- components/xorg-lib-xcb.bst
- components/xorg-lib-xcursor.bst
- components/mtdev.bst
- components/libinput.bst
- components/dummy-gbm.bst
- components/libwebp.bst
- components/libva.bst
- components/lcms.bst
- components/gstreamer.bst
- components/gstreamer-plugins-base.bst
- components/pipewire.bst

environment:
  # FIXME, extract the required headers from libdrm that are needed
  PKG_CONFIG_PATH: '%{libdir}/GL/default/lib/pkgconfig:'

variables:
  # FIXME Does not support pipewire 0.3
  meson-local: >-
    -Dbackend-rdp=false
    -Dcolor-management-colord=true
    -Dpipewire=false

  meson-lto-flags: ""

sources:
- kind: git_tag
  track: main
  url: freedesktop:wayland/weston.git
  ref: 10.0.0-0-g4a03924604bc76374eab0536e86e838ce1246510
