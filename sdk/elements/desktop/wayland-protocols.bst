kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: desktop/wayland.bst

sources:
  - kind: tar
    url: https://wayland.freedesktop.org/releases/wayland-protocols-1.15.tar.xz
    ref: dabb727a4b64e87bfa8c025c1d63919ce12100b49fdeded31857644a59729ee2
