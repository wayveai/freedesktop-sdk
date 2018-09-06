kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: desktop/gobject-introspection.bst
    type: build
  - filename: desktop/orc.bst
  - filename: desktop/gstreamer.bst
  - filename: desktop/mesa.bst
  - filename: base/autoconf.bst
    type: build
  - filename: base/autoconf-archive.bst
    type: build
  - filename: base/automake.bst
    type: build
  - filename: base/gettext.bst
    type: build
  - filename: base/git.bst
    type: build
  - filename: base/libtool.bst
    type: build
  - filename: base/libvorbis.bst
  - filename: base/pkg-config.bst
    type: build
  - filename: base/which.bst
    type: build


variables:
  conf-local: |
      --enable-experimental \
      --enable-orc \
      --enable-vorbis

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libgstfft-1.0.so"
          - "%{libdir}/libgstrtp-1.0.so"
          - "%{libdir}/libgstsdp-1.0.so"
          - "%{libdir}/libgstvideo-1.0.so"
          - "%{libdir}/libgstapp-1.0.so"
          - "%{libdir}/libgstriff-1.0.so"
          - "%{libdir}/libgstrtsp-1.0.so"
          - "%{libdir}/libgstallocators-1.0.so"
          - "%{libdir}/libgsttag-1.0.so"
          - "%{libdir}/libgstaudio-1.0.so"
          - "%{libdir}/libgstpbutils-1.0.so"
          - "%{libdir}/libgstgl-1.0.so"

sources:
  - kind: git
    url: freedesktop:gstreamer/gst-plugins-base
    track: 1.14
    ref: 5c637f685fb4f791e07c43d9818d0369bdb97dca # 1.14.2
    submodules:
      common:
        url: freedesktop:gstreamer/common
