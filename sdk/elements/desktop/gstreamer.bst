kind: myautotools

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
  - kind: tar
    url: https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.12.3.tar.xz
    ref: d388f492440897f02b01eebb033ca2d41078a3d85c0eddc030cdea5a337a216e
