kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection.bst
- components/gtk-doc.bst

depends:
- bootstrap-import.bst
- components/orc.bst
- components/gstreamer.bst
- components/pango.bst
- components/xorg-lib-xv.bst
- components/libogg.bst
- components/libtheora.bst
- components/libvorbis.bst
- components/opus.bst
- components/gdk-pixbuf.bst
- components/gtk3.bst
- components/mesa-headers.bst
- components/iso-codes.bst
- components/alsa-lib.bst
- components/sdl2.bst

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
        - '%{libdir}/gstreamer-1.0/include'
        - '%{libdir}/gstreamer-1.0/include/**'

config:
  install-commands:
    (>):
    - rm %{install-root}%{includedir}/GL/glext.h
    - rm %{install-root}%{includedir}/KHR/khrplatform.h

sources:
- kind: git_tag
  url: freedesktop:gstreamer/gst-plugins-base.git
  track: '1.16'
  ref: 1.16.2-0-g9d3581b2e6f12f0b7e790d1ebb63b90cf5b1ef4e
  submodules:
    common:
      checkout: false
      url: freedesktop:gstreamer/common.git
- kind: git_tag
  url: freedesktop:gstreamer/meson-ports/gl-headers.git
  directory: subprojects/gl-headers
  track: master
  ref: 5c8c7c0d3ca1f0b783272dac0b95e09414e49bc8
