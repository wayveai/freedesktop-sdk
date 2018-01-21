kind: autotools

depends:
  - filename: base.bst
    type: build
  - filename: desktop/wayland.bst

sources:
  - kind: tar
    url: https://wayland.freedesktop.org/releases/wayland-protocols-1.11.tar.xz
    ref: 3afcee1d51c5b1d70b59da790c9830b354236324b19b2b7af9683bd3b7be6804

