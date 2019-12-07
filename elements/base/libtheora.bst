kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/libogg.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libtheora.so'
        - '%{libdir}/libtheoraenc.so'
        - '%{libdir}/libtheoradec.so'

sources:
- kind: tar
  url: tar_https:downloads.xiph.org/releases/theora/libtheora-1.1.1.tar.xz
  ref: f36da409947aa2b3dcc6af0a8c2e3144bc19db2ed547d64e9171c59c66561c61
