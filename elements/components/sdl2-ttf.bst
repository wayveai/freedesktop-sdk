kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/freetype.bst
- filename: components/sdl2.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libSDL2_ttf.so'

sources:
- kind: tar
  url: libsdl:SDL_ttf/release/SDL2_ttf-2.0.15.tar.gz
  ref: a9eceb1ad88c1f1545cd7bd28e7cbc0b2c14191d40238f531a15b01b1b22cd33
