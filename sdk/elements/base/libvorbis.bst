kind: myautotools

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/file.bst
    type: build
  - filename: base/diffutils.bst
    type: build
  - filename: base/libogg.bst

public:
  bst:
    split-rules:
      devel:
        - "%{libdir}/libvorbis.so"
        - "%{libdir}/libvorbisfile.so"
        - "%{libdir}/libvorbisenc.so"

sources:
  - kind: tar
    url: http://downloads.xiph.org/releases/vorbis/libvorbis-1.3.5.tar.xz
    ref: 54f94a9527ff0a88477be0a71c0bab09a4c3febe0ed878b24824906cd4b0e1d1
