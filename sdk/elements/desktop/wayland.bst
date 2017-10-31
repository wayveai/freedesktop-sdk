kind: myautotools

depends:
  - filename: base-stack.bst

variables:
  conf-extra: |
      --disable-documentation

sources:
  - kind: tar
    url: https://wayland.freedesktop.org/releases/wayland-1.14.0.tar.xz
    ref: ed80cabc0961a759a42092e2c39aabfc1ec9a13c86c98bbe2b812f008da27ab8

