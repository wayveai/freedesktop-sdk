kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/orc.bst
- filename: components/gobject-introspection.bst
  type: build
- filename: components/gstreamer.bst
- filename: components/gstreamer-plugins-base.bst
- filename: components/ladspa-sdk.bst
- filename: components/libdrm.bst
- filename: components/libfdk-aac.bst
- filename: components/libglvnd.bst
- filename: components/librsvg.bst
- filename: components/mesa.bst
- filename: components/openal.bst
- filename: components/vulkan.bst
- filename: components/wayland.bst
- filename: components/wayland-protocols.bst
  type: build
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/curl.bst
- filename: components/gettext.bst
  type: build
- filename: components/libwebp.bst
- filename: components/sndfile.bst
- filename: components/which.bst
  type: build


variables:
  conf-local: |
    --enable-experimental \
    --enable-introspection \
    --enable-orc \
    --enable-wayland \
    --disable-vdpau \
    --enable-ladspa

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
  ref: 1.14.4-0-g566e4ecc223b18fce8bd932f5e4885f41f746dd4
  submodules:
    common:
      checkout: True
      url: freedesktop:gstreamer/common
