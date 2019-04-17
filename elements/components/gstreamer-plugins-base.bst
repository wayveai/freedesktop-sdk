kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/gobject-introspection.bst
  type: build
- filename: components/orc.bst
- filename: components/gstreamer.bst
- filename: components/mesa.bst
- filename: components/pango.bst
- filename: components/xorg-lib-xv.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/gettext.bst
  type: build
- filename: components/git-minimal.bst
  type: build
- filename: components/libogg.bst
- filename: components/libtheora.bst
- filename: components/libvorbis.bst
- filename: components/opus.bst
- filename: components/which.bst
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
  url: freedesktop:gstreamer/gst-plugins-base
  track: '1.14'
  ref: 1.14.4-0-g384ff7d0268c71e76f7328a9ca6dfe96e4a3ab23
  submodules:
    common:
      checkout: True
      url: freedesktop:gstreamer/common
