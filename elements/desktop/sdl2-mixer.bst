kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/libflac.bst
- filename: base/libvorbis.bst
- filename: desktop/mpg123.bst
- filename: desktop/sdl2.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libSDL2_mixer.so'

sources:
- kind: tar
  url: https://www.libsdl.org/projects/SDL_mixer/release/SDL2_mixer-2.0.2.tar.gz
  ref: 4e615e27efca4f439df9af6aa2c6de84150d17cbfd12174b54868c12f19c83bb
