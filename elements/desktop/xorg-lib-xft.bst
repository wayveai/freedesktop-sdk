kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: desktop/xorg-util-macros.bst
  type: build
- filename: desktop/xorg-lib-x11.bst
- filename: desktop/xorg-lib-xrender.bst
- filename: desktop/freetype.bst
- filename: desktop/fontconfig.bst
- filename: base/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXft.so'

sources:
- kind: tar
  url: tar_https:www.x.org/archive/individual/lib/libXft-2.3.2.tar.bz2
  ref: f5a3c824761df351ca91827ac221090943ef28b248573486050de89f4bfcdc4c
