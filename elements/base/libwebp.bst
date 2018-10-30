kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/libpng.bst
- filename: base/jpeg.bst
- filename: base/giflib.bst
- filename: base/libtiff.bst
- filename: base/buildsystem-autotools.bst
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

sources:
- kind: git_tag
  url: https://chromium.googlesource.com/webm/libwebp
  ref: 698b8844e38a0c5ca50bb20f866e71291bfc3b36    # 1.0.0
