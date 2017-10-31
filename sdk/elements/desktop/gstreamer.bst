kind: myautotools

depends:
  - filename: base-stack.bst

variables:
  conf-extra: |
    --enable-debug \
    --disable-examples

sources:
  - kind: tar
    url: https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.12.3.tar.xz
    ref: d388f492440897f02b01eebb033ca2d41078a3d85c0eddc030cdea5a337a216e
