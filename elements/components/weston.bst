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

# FIXME colord depends on intltool (polkit) and python2 (mozjs)
# FIXME Does not build against Pipewire 0.3
variables:
  meson-local: >-
    -Dbackend-rdp=false
    -Dcolor-management-colord=false
    -Dsimple-dmabuf-drm=intel,etnaviv
    -Dpipewire=false

sources:
- kind: git_tag
  track: master
  url: freedesktop:wayland/weston.git
  ref: 7.0.0-0-g3180fa8a123a000e715e8f5adf45727ccc88fd56
