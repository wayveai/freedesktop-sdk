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

sources:
- kind: git_tag
  url: freedesktop:gstreamer/gst-plugins-base.git
  track: master
  track-extra:
  - '1.18'
  match:
  - 1.*[02468].*
  ref: 1.18.4-0-gce69d1068af058425b083aaa1b8c268b1b2e5ddd
  submodules:
    common:
      checkout: false
      url: freedesktop:gstreamer/common.git
- kind: patch
  path: patches/gstreamer-plugins-base/atomicity-fix-backport.patch
- kind: patch
  path: patches/gstreamer-plugins-base/gstgl-meson-0.58.patch  
- kind: patch
  path: patches/gstreamer-plugins-base/gl-wayland-proxy-queue.patch
