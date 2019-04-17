kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/libpng.bst
- filename: components/jpeg.bst
- filename: components/giflib.bst
- filename: components/libtiff.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

variables:
  conf-local: |
    --disable-experimental \
    --disable-wic \
    --enable-jpeg \
    --enable-png \
    --enable-gif \
    --enable-tiff \
    --enable-libwebpmux \
    --enable-libwebpdemux \
    --enable-libwebpdecoder \
    --enable-threading

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libwebpdecoder.so'
        - '%{libdir}/libwebpdemux.so'
        - '%{libdir}/libwebpmux.so'
        - '%{libdir}/libwebp.so'
  cpe:
    version: '1.0.2'

sources:
- kind: git_tag
  url: https://chromium.googlesource.com/webm/libwebp
  ref: v1.0.2-0-g2b98df90cb75cfc1cf4505a59a7b25499fa10887
