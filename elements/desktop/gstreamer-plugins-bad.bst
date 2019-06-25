kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: desktop/orc.bst
- filename: desktop/gobject-introspection.bst
  type: build
- filename: desktop/gstreamer.bst
- filename: desktop/gstreamer-plugins-base.bst
- filename: desktop/libdrm.bst
- filename: desktop/libfdk-aac.bst
- filename: desktop/libglvnd.bst
- filename: desktop/librsvg.bst
- filename: desktop/libvdpau.bst
- filename: desktop/mesa.bst
- filename: desktop/openal.bst
- filename: desktop/vulkan.bst
- filename: desktop/wayland.bst
- filename: desktop/wayland-protocols.bst
  type: build
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/curl.bst
- filename: base/gettext.bst
  type: build
- filename: base/libwebp.bst
- filename: base/sndfile.bst
- filename: base/which.bst
  type: build


variables:
  conf-local: |
    --enable-experimental \
    --enable-introspection \
    --enable-orc \
    --enable-wayland

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgstbadallocators-1.0.so'
        - '%{libdir}/libgstbadbase-1.0.so'
        - '%{libdir}/libgstcodecparsers-1.0.so'
        - '%{libdir}/libgstplayer-1.0.so'
        - '%{libdir}/libgstbadvideo-1.0.so'
        - '%{libdir}/libgstbadaudio-1.0.so'
        - '%{libdir}/libgstmpegts-1.0.so'
        - '%{libdir}/libgstadaptivedemux-1.0.so'
        - '%{libdir}/libgstinsertbin-1.0.so'
        - '%{libdir}/libgsturidownloader-1.0.so'
        - '%{libdir}/libgstbasecamerabinsrc-1.0.so'
        - '%{libdir}/libgstphotography-1.0.so'
        - '%{libdir}/libgstisoff-1.0.so'
        - '%{libdir}/libgstwebrtc-1.0.so'
        - '%{libdir}/libgstwayland-1.0.so'

sources:
- kind: git_tag
  url: freedesktop:gstreamer/gst-plugins-bad
  track: '1.14'
  ref: 1.14.5-0-gdc1b94a15290172ffcc57c57f2b7ff6ee9322a5d
  submodules:
    common:
      checkout: true
      url: freedesktop:gstreamer/common
