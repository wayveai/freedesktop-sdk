kind: myautotools

depends:
  - filename: base.bst
    type: build
  - filename: desktop/ibus.bst
  - filename: desktop/dbus.bst
  - filename: desktop/mesa.bst
  - filename: desktop/xorg-lib-x11.bst
  - filename: desktop/wayland.bst
  - filename: desktop/pulseaudio.bst

variables:
  conf-extra: |
    --enable-sdl-dlopen \
    --disable-arts \
    --disable-esd \
    --disable-nas \
    --enable-pulseaudio \
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
          - "%{bindir}/sdl2-config"
          - "%{libdir}/libSDL2.so"

sources:
  - kind: tar
    url: https://www.libsdl.org/release/SDL2-2.0.7.tar.gz
    ref: ee35c74c4313e2eda104b14b1b86f7db84a04eeab9430d56e001cea268bf4d5e
