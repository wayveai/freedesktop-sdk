kind: myautotools

depends:
  - filename: base-stack.bst
  - filename: desktop/libdrm.bst
  - filename: desktop/xorg-lib-x11.bst
  - filename: desktop/xorg-lib-xext.bst
  - filename: desktop/xorg-lib-xfixes.bst
  - filename: desktop/mesa.bst
  - filename: desktop/wayland-protocols.bst

sources:
  - kind: tar
    url: https://www.freedesktop.org/software/vaapi/releases/libva/libva-1.8.2.tar.bz2
    ref: 9ed3e3ddc8f47a715d4c6ec366beb21c83fc4e8a3d4d39a811baff76f0a0cede
