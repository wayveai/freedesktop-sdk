kind: autotools

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: public-stacks/buildsystem-autotools.bst
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
  - filename: vm/linux-vm-boot/mtdev.bst
  - filename: vm/linux-vm-boot/libinput.bst
  - filename: vm/mesa-default.bst

variables:
  conf-local: |
    --disable-setuid-install \
    --enable-demo-clients-install

sources:
  - kind: git_tag
    url: freedesktop:wayland/weston.git
    ref: 5.0.0-0-g030e7d40fe18869880fc72ce9ae3cbeca6f49600
