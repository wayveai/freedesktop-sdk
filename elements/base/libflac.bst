kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/libogg.bst
  - filename: base/autoconf.bst
    type: build
  - filename: base/automake.bst
    type: build
  - filename: base/libtool.bst
    type: build
  - filename: base/pkg-config.bst
    type: build
  - filename: base/gettext.bst
    type: build

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
  - kind: git
    url: https://git.xiph.org/flac.git
    track: 1.3.2
    ref: ac39d3719f16dfb6e08d2fbde8ccaf34a266c81d # 1.3.2
