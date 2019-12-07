kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: desktop/sdl2.bst
- filename: base/jpeg.bst
- filename: base/libpng.bst
- filename: base/libtiff.bst
- filename: base/libwebp.bst

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
  url: libsdl:SDL_image/release/SDL2_image-2.0.4.tar.gz
  ref: e74ec49c2402eb242fbfa16f2f43a19582a74c2eabfbfb873f00d4250038ceac
