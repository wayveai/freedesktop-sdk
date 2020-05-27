kind: meson

depends:
- filename: bootstrap-import.bst
  type: build
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/libunwind.bst
- filename: components/linux-pam.bst
- filename: components/cairo.bst
- filename: components/libdrm.bst
- filename: components/wayland.bst
- filename: components/wayland-protocols.bst
  type: build
- filename: components/systemd.bst
- filename: components/xorg-lib-xcb.bst
- filename: components/xorg-lib-xcursor.bst
- filename: components/mtdev.bst
- filename: components/libinput.bst
- filename: components/dummy-gbm.bst
- filename: components/libwebp.bst
- filename: components/libva.bst
- filename: components/lcms.bst
- filename: components/gstreamer.bst
- filename: components/gstreamer-plugins-base.bst
- filename: components/pipewire.bst
- filename: extensions/mesa/libdrm.bst
  type: build

environment:
  # FIXME, extract the required headers from libdrm that are needed
  PKG_CONFIG_PATH: '%{libdir}/GL/default/lib/pkgconfig:'

variables:
  # FIXME colord depends on intltool (polkit) and python2 (mozjs)
  # FIXME Does not support pipewire 0.3
  meson-local: >-
    -Dbackend-rdp=false
    -Dcolor-management-colord=false
    -Dpipewire=false

sources:
- kind: git_tag
  track: master
  url: freedesktop:wayland/weston.git
  ref: 8.0.0-0-g33b06bdece396b285882160324ac894d1db7ecb0
