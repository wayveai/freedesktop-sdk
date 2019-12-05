kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/libsamplerate.bst
- filename: components/dbus.bst
- filename: components/fcitx.bst
  type: build
- filename: components/ibus.bst
  type: build
- filename: components/libpulse.bst
- filename: components/libxkbcommon.bst
- filename: components/mesa-headers.bst
- filename: components/wayland.bst
- filename: components/wayland-protocols.bst
  type: build
- filename: components/xorg-lib-x11.bst

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

    - |
      mkdir -p "%{install-root}%{includedir}/%{gcc_triplet}/SDL2"
      mv "%{install-root}%{includedir}/SDL2/SDL_config.h" "%{install-root}%{includedir}/%{gcc_triplet}/SDL2/SDL_config.h"
      sed -i 's,\(# *include *\)"\(SDL_[^"]*\)",\1<SDL2/\2>,' "%{install-root}%{includedir}/%{gcc_triplet}/SDL2/SDL_config.h"
      sed -i 's,^Cflags: \(.*\),Cflags: -I%{includedir}/%{gcc_triplet}/SDL2 \1,' "%{install-root}%{libdir}/pkgconfig/sdl2.pc"
      sed -i 's,\(-I%{includedir}/SDL2\),-I%{includedir}/%{gcc_triplet}/SDL2 \1,' "%{install-root}%{bindir}/sdl2-config"

    - |
      cat >>%{install-root}%{libdir}/cmake/SDL2/sdl2-config.cmake <<EOF
      list(INSERT SDL2_INCLUDE_DIRS 0 "%{includedir}/%{gcc_triplet}/SDL2")
      EOF

    - |
      cat <<EOF >"%{install-root}%{includedir}/SDL2/SDL_config.h"
      #if defined(__x86_64__)
      # include "x86_64-linux-gnu/SDL2/SDL_config.h"
      #elif defined(__i386__)
      # include "i386-linux-gnu/SDL2/SDL_config.h"
      #elif defined(__aarch64__)
      # include "aarch64-linux-gnu/SDL2/SDL_config.h"
      #elif defined(__arm__)
      # include "arm-linux-gnueabihf/SDL2/SDL_config.h"
      #elif defined(__powerpc64__)
      # include "powerpc64le-linux-gnu/SDL2/SDL_config.h"
      #else
      # error "Unknown cross-compiler"
      #endif
      EOF

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/sdl2-config'
        - '%{libdir}/libSDL2.so'

sources:
- kind: tar
  url: tar_https:www.libsdl.org/release/SDL2-2.0.10.tar.gz
  ref: b4656c13a1f0d0023ae2f4a9cf08ec92fffb464e0f24238337784159b8b91d57
