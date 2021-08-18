kind: autotools

depends:
- bootstrap-import.bst
- components/libpng.bst
- components/jpeg.bst
- components/giflib.bst

build-depends:
- public-stacks/buildsystem-autotools.bst

variables:
  conf-local: |
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
  url: chromium:webm/libwebp.git
  track: master
  ref: v1.2.1-0-g9ce5843dbabcfd3f7c39ec7ceba9cbeb213cbfdf
