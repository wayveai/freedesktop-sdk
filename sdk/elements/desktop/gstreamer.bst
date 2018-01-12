kind: autotools

depends:
  - filename: base.bst
    type: build

variables:
  conf-local: |
    --enable-debug \
    --disable-examples

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
    ref: a6653b617cf42de70be087188d41c1cff6193b05  # 1.12.13
    submodules:
      common:
        url: freedesktop:gstreamer/common
