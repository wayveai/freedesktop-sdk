kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: desktop/freetype.bst
- filename: desktop/sdl2.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libSDL2_ttf.so'

sources:
- kind: tar
  url: libsdl:SDL_ttf/release/SDL2_ttf-2.0.14.tar.gz
  ref: 34db5e20bcf64e7071fe9ae25acaa7d72bdc4f11ab3ce59acc768ab62fe39276
