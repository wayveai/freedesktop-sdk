kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/libsamplerate.bst
- filename: desktop/dbus.bst
- filename: desktop/fcitx.bst
- filename: desktop/ibus.bst
- filename: desktop/libpulse.bst
- filename: desktop/mesa.bst
- filename: desktop/wayland.bst
- filename: desktop/wayland-protocols.bst
  type: build
- filename: desktop/xorg-lib-x11.bst

variables:
  conf-local: |
    --enable-sdl-dlopen \
    --disable-arts \
    --disable-esd \
    --disable-nas \
    --disable-alsa \
    --disable-oss \
    --disable-sndio \
    --disable-libudev \
    --enable-video-wayland \
    --enable-wayland-shared=no

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/sdl2-config'
        - '%{libdir}/libSDL2.so'

sources:
- kind: tar
  url: https://www.libsdl.org/release/SDL2-2.0.8.tar.gz
  ref: edc77c57308661d576e843344d8638e025a7818bff73f8fbfab09c3c5fd092ec
- kind: patch
  path: patches/sdl2-unity-fix.patch
