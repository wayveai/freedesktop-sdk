kind: meson

depends:
  - filename: base.bst
    type: build

variables:
  meson-local: |
    -Ddisable-examples=true

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libgstcheck-1.0.so"
          - "%{libdir}/libgstbase-1.0.so"
          - "%{libdir}/libgstnet-1.0.so"
          - "%{libdir}/libgstreamer-1.0.so"
          - "%{libdir}/libgstcontroller-1.0.so"

sources:
  - kind: git
    url: freedesktop:gstreamer/gstreamer
    track: 1.12
    ref: 505a24ff6843a04e4f75c5e03caa7b2774806fc3  # 1.12.14
    submodules:
      common:
        url: freedesktop:gstreamer/common
