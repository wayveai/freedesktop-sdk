kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/sdl2.bst
- filename: components/jpeg.bst
- filename: components/libpng.bst
- filename: components/libtiff.bst
- filename: components/libwebp.bst

variables:
  conf-local: |
    --disable-jpg-shared \
    --disable-png-shared \
    --disable-tif-shared \
    --disable-webp-shared

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libSDL2_image.so'

sources:
- kind: tar
  url: libsdl:SDL_image/release/SDL2_image-2.0.5.tar.gz
  ref: bdd5f6e026682f7d7e1be0b6051b209da2f402a2dd8bd1c4bd9c25ad263108d0
