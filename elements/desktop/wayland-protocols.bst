kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: desktop/wayland.bst

sources:
- kind: tar
  url: tar_https:wayland.freedesktop.org/releases/wayland-protocols-1.16.tar.xz
  ref: 6b1485951fdcd36a960c870c46f28b03a3e5121fb46246916333ed07f78c98c5
