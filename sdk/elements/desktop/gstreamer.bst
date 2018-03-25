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
    track: 1.14
    ref: 80e0e90d00bb358ca9dc071cf6de010ec5ae2644 # 1.14.0
    submodules:
      common:
        url: freedesktop:gstreamer/common
