kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/ibus.bst
- components/wayland-protocols.bst

depends:
- bootstrap-import.bst
- components/libsamplerate.bst
- components/libdbus.bst
- components/libpulse.bst
- components/libxkbcommon.bst
- components/mesa-headers.bst
- components/wayland.bst
- components/xorg-lib-x11.bst
- components/xorg-lib-xcursor.bst

variables:
  conf-local: >-
    --enable-sdl-dlopen
    --disable-arts
    --disable-esd
    --disable-nas
    --disable-alsa
    --disable-oss
    --disable-sndio
    --disable-libudev
    --enable-video-wayland
    --enable-wayland-shared=no
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
      #elif defined(__riscv) && (__riscv_xlen == 64)
      # include "riscv64-linux-gnu/SDL2/SDL_config.h"
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
- kind: git_tag
  url: github:libsdl-org/SDL.git
  track: main
  ref: release-2.0.20-0-gb424665e0899769b200231ba943353a5fee1b6b6
- kind: patch
  path: patches/sdl2/cmake-remove-static-target.patch
