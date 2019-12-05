kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/sdl2.bst

variables:
  conf-local: |
    --disable-gui

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libSDL2_net.so'

sources:
- kind: tar
  url: libsdl:SDL_net/release/SDL2_net-2.0.1.tar.gz
  ref: 15ce8a7e5a23dafe8177c8df6e6c79b6749a03fff1e8196742d3571657609d21
