kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: desktop/orc.bst
  - filename: desktop/gobject-introspection.bst
    type: build
  - filename: desktop/gstreamer.bst
  - filename: desktop/gstreamer-plugins-base.bst
  - filename: desktop/libfdk-aac.bst
  - filename: desktop/wayland.bst
  - filename: base/autoconf.bst
    type: build
  - filename: base/automake.bst
    type: build
  - filename: base/gettext.bst
    type: build
  - filename: base/libtool.bst
    type: build
  - filename: base/pkg-config.bst
    type: build
  - filename: base/which.bst
    type: build


variables:
  conf-local: |
    --enable-experimental \
    --enable-orc \
    --enable-wayland

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
    ref: c070d6921ea3427713a11bfc7f828cfba3dcfca7 # 1.14.2
    submodules:
      common:
        url: freedesktop:gstreamer/common
