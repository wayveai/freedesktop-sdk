kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: desktop/sdl2.bst

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
  url: https://www.libsdl.org/projects/SDL_image/release/SDL2_image-2.0.3.tar.gz
  ref: 3510c25da735ffcd8ce3b65073150ff4f7f9493b866e85b83738083b556d2368
