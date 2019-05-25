kind: meson

depends:
- filename: bootstrap-import.bst
- filename: components/gobject-introspection.bst
  type: build
- filename: components/orc.bst
- filename: components/gstreamer.bst
- filename: components/pango.bst
- filename: components/xorg-lib-xv.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/git-minimal.bst
  type: build
- filename: components/libogg.bst
- filename: components/libtheora.bst
- filename: components/libvorbis.bst
- filename: components/opus.bst
- filename: components/mesa-headers.bst

variables:
  conf-local: |
    --enable-experimental \
    --enable-introspection \
    --enable-ogg \
    --enable-opus \
    --enable-orc \
    --enable-pango \
    --enable-theora \
    --enable-vorbis \
    --enable-opengl \
    --enable-gles2 \
    --enable-egl \
    --enable-glx \
    --enable-gl

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
  track: '1.16'
  ref: 1.16.0-0-ge0f8f635a96a3639be4d519fcf234b619bb74ca6
  submodules:
    common:
      checkout: true
      url: freedesktop:gstreamer/common
- kind: git_tag
  url: freedesktop:gstreamer/meson-ports/gl-headers.git
  directory: subprojects/gl-headers
  track: master
  ref: 5c8c7c0d3ca1f0b783272dac0b95e09414e49bc8
