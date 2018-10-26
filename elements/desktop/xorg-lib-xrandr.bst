kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: desktop/xorg-lib-xext.bst
- filename: desktop/xorg-lib-xrender.bst
- filename: base/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXrandr.so'

sources:
- kind: tar
  url: https://www.x.org/archive/individual/lib/libXrandr-1.5.1.tar.bz2
  ref: 1ff9e7fa0e4adea912b16a5f0cfa7c1d35b0dcda0e216831f7715c8a3abcf51a
