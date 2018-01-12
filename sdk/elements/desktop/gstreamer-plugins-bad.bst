kind: autotools

depends:
  - filename: base.bst
    type: build
  - filename: desktop/orc.bst
  - filename: desktop/gstreamer.bst
  - filename: desktop/gstreamer-plugins-base.bst

variables:
  conf-local: |
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
  - kind: git
    url: freedesktop:gstreamer/gst-plugins-bad
    track: 1.12
    ref: 8f66ff25f9cabc170c57d75a74984103c7fcb965  # 1.12.13
    submodules:
      common:
        url: freedesktop:gstreamer/common
