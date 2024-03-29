kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection.bst
- components/hotdoc.bst

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
  command-subdir: subprojects/gst-plugins-base

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

(@):
- elements/include/gstreamer-source.yml
