kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/libflac.bst
- filename: components/libvorbis.bst
- filename: components/mpg123.bst
- filename: components/sdl2.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libSDL2_mixer.so'

sources:
- kind: tar
  url: libsdl:SDL_mixer/release/SDL2_mixer-2.0.4.tar.gz
  ref: b4cf5a382c061cd75081cf246c2aa2f9df8db04bdda8dcdc6b6cca55bede2419
