kind: myautotools

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/libpng.bst
  - filename: base/jpeg.bst
  - filename: base/giflib.bst
  - filename: base/libtiff.bst

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
          - "%{libdir}/libwebpdecoder.so"
          - "%{libdir}/libwebpdemux.so"
          - "%{libdir}/libwebpmux.so"
          - "%{libdir}/libwebp.so"

sources:
  - kind: tar
    url: http://storage.googleapis.com/downloads.webmproject.org/releases/webp/libwebp-0.6.1.tar.gz
    ref: 06503c782d9f151baa325591c3579c68ed700ffc62d4f5a32feead0ff017d8ab
