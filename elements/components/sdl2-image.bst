kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/sdl2.bst
- filename: components/jpeg.bst
- filename: components/libpng.bst
- filename: components/libtiff.bst
- filename: components/libwebp.bst

variables:
  conf-local: >-
    --disable-jpg-shared
    --disable-png-shared
    --disable-tif-shared
    --disable-webp-shared

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libSDL2_image.so'

sources:
- kind: git_tag
  url: github:libsdl-org/SDL_image.git
  track: main
  match:
  - release-*
  ref: release-2.6.0-0-g7b3347c0d90d1f1e9cc4e06e145432697ca4e68f
