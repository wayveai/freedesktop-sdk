kind: autotools

depends:
  - filename: base/libogg.bst

variables:
  conf-local: |
    --enable-cpplibs \
    --enable-ogg

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libFLAC.so"
          - "%{libdir}/libFLAC++.so"

sources:
  - kind: tar
    url: https://downloads.xiph.org/releases/flac/flac-1.3.2.tar.xz
    ref: 91cfc3ed61dc40f47f050a109b08610667d73477af6ef36dcad31c31a4a8d53f
