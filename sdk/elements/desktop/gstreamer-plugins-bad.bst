kind: myautotools

depends:
  - filename: base-stack.bst
  - filename: desktop/orc.bst
  - filename: desktop/gstreamer.bst
  - filename: desktop/gstreamer-plugins-base.bst

variables:
  conf-extra: |
      --enable-experimental \
      --enable-orc

sources:
  - kind: tar
    url: https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.12.3.tar.xz
    ref: 36d059761852bed0f1a7fcd3ef64a8aeecab95d2bca53cd6aa0f08054b1cbfec
