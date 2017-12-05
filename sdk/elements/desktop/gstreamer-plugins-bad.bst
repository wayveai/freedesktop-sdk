kind: myautotools

depends:
  - filename: base.bst
    type: build
  - filename: desktop/orc.bst
  - filename: desktop/gstreamer.bst
  - filename: desktop/gstreamer-plugins-base.bst

variables:
  conf-extra: |
      --enable-experimental \
      --enable-orc

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libgstbadallocators-1.0.so"
          - "%{libdir}/libgstbadbase-1.0.so"
          - "%{libdir}/libgstcodecparsers-1.0.so"
          - "%{libdir}/libgstplayer-1.0.so"
          - "%{libdir}/libgstbadvideo-1.0.so"
          - "%{libdir}/libgstbadaudio-1.0.so"
          - "%{libdir}/libgstmpegts-1.0.so"
          - "%{libdir}/libgstadaptivedemux-1.0.so"
          - "%{libdir}/libgstinsertbin-1.0.so"
          - "%{libdir}/libgsturidownloader-1.0.so"
          - "%{libdir}/libgstbasecamerabinsrc-1.0.so"
          - "%{libdir}/libgstphotography-1.0.so"

sources:
  - kind: tar
    url: https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.12.3.tar.xz
    ref: 36d059761852bed0f1a7fcd3ef64a8aeecab95d2bca53cd6aa0f08054b1cbfec
