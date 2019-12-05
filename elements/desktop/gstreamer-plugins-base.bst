kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: desktop/gobject-introspection.bst
  type: build
- filename: desktop/orc.bst
- filename: desktop/gstreamer.bst
- filename: desktop/mesa.bst
- filename: desktop/pango.bst
- filename: desktop/xorg-lib-xv.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/gettext.bst
  type: build
- filename: base/git-minimal.bst
  type: build
- filename: base/libogg.bst
- filename: base/libtheora.bst
- filename: base/libvorbis.bst
- filename: base/opus.bst
- filename: base/which.bst
  type: build


variables:
  conf-local: |
    --enable-experimental \
    --enable-introspection \
    --enable-ogg \
    --enable-opus \
    --enable-orc \
    --enable-pango \
    --enable-theora \
    --enable-vorbis

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgstfft-1.0.so'
        - '%{libdir}/libgstrtp-1.0.so'
        - '%{libdir}/libgstsdp-1.0.so'
        - '%{libdir}/libgstvideo-1.0.so'
        - '%{libdir}/libgstapp-1.0.so'
        - '%{libdir}/libgstriff-1.0.so'
        - '%{libdir}/libgstrtsp-1.0.so'
        - '%{libdir}/libgstallocators-1.0.so'
        - '%{libdir}/libgsttag-1.0.so'
        - '%{libdir}/libgstaudio-1.0.so'
        - '%{libdir}/libgstpbutils-1.0.so'
        - '%{libdir}/libgstgl-1.0.so'

sources:
- kind: git_tag
  url: freedesktop:gstreamer/gst-plugins-base.git
  track: '1.14'
  ref: 1.14.4-0-g384ff7d0268c71e76f7328a9ca6dfe96e4a3ab23
  submodules:
    common:
      checkout: True
      url: freedesktop:gstreamer/common.git
