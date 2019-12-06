kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/libsamplerate.bst
- filename: desktop/dbus.bst
- filename: desktop/fcitx.bst
  type: build
- filename: desktop/ibus.bst
  type: build
- filename: desktop/libpulse.bst
- filename: desktop/libxkbcommon.bst
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
    --enable-wayland-shared=no \
    --disable-rpath

config:
  install-commands:
    (>):
    - |
      find "%{install-root}" -name "lib*.a" -exec rm {} ";"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/sdl2-config'
        - '%{libdir}/libSDL2.so'

sources:
- kind: tar
  url: tar_https:www.libsdl.org/release/SDL2-2.0.9.tar.gz
  ref: 255186dc676ecd0c1dbf10ec8a2cc5d6869b5079d8a38194c2aecdff54b324b1
