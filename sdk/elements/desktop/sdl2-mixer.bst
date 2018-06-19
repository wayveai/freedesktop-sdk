kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: desktop/sdl2.bst

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libSDL2_mixer.so"

sources:
  - kind: tar
    url: https://www.libsdl.org/projects/SDL_mixer/release/SDL2_mixer-2.0.1.tar.gz
    ref: 5a24f62a610249d744cbd8d28ee399d8905db7222bf3bdbc8a8b4a76e597695f
