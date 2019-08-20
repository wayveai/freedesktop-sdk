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
- filename: components/gdk-pixbuf.bst
- filename: components/gtk3.bst
- filename: components/mesa-headers.bst
- filename: components/iso-codes.bst
- filename: components/alsa-lib.bst
- filename: components/sdl2.bst
- filename: components/gtk-doc.bst
  type: build

variables:
  (?):
  - target_arch == "i686" or target_arch == "arm":
      gl-api: opengl
  - target_arch != "i686" and target_arch != "arm":
      gl-api: opengl,gles2

  meson-local: >-
    -Dgl_api=%{gl-api}
    -Dgl_platform=egl,glx
    -Dintrospection=enabled
    -Dpackage-origin="freedesktop-sdk"
    -Dcdparanoia=disabled
    -Dgl-graphene=disabled
    -Dlibvisual=disabled
    -Dtremor=disabled
    -Dexamples=disabled

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

config:
  install-commands:
    (>):
    - rm %{install-root}%{includedir}/GL/glext.h
    - rm %{install-root}%{includedir}/KHR/khrplatform.h

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
