kind: autotools

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/buildsystem-autotools.bst
    type: build
  - filename: base/libunwind.bst
  - filename: base/linux-pam.bst
  - filename: desktop/cairo.bst
  - filename: desktop/libdrm.bst
  - filename: desktop/mesa.bst
  - filename: desktop/wayland.bst
  - filename: desktop/wayland-protocols.bst
    type: build
  - filename: desktop/systemd.bst
  - filename: desktop/xorg-lib-xcb.bst
  - filename: desktop/xorg-lib-xcursor.bst
  - filename: vm/linux-vm-boot/mtdev.bst
  - filename: vm/linux-vm-boot/libinput.bst

variables:
  conf-local: |
    --disable-setuid-install \
    --enable-demo-clients-install

sources:
  - kind: git_tag
    url: freedesktop:wayland/weston.git
    ref: 5.0.0-0-g030e7d40fe18869880fc72ce9ae3cbeca6f49600
