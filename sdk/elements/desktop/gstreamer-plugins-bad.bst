kind: meson

depends:
  - filename: bootstrap-import.bst
  - filename: desktop/orc.bst
  - filename: desktop/gstreamer.bst
  - filename: desktop/gstreamer-plugins-base.bst
  - filename: base/meson.bst
    type: build
  - filename: base/ninja.bst
    type: build
  - filename: base/pkg-config.bst
    type: build

variables:
  meson-local: |
    -Duse_orc=yes

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
          - "%{libdir}/libgstisoff-1.0.so"
          - "%{libdir}/libgstwebrtc-1.0.so"

sources:
  - kind: git
    url: freedesktop:gstreamer/gst-plugins-bad
    track: 1.14
    ref: 48cde372d6f5b9feff464bffb734686e0cbf0ca1 # 1.14.0
    submodules:
      common:
        url: freedesktop:gstreamer/common
