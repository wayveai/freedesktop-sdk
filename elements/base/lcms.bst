kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/libtiff.bst
- filename: base/jpeg.bst

variables:
  conf-local: |
    --with-threads \
    --with-tiff \
    --with-jpeg

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/liblcms2.so'
  cpe:
    product: little_cms_color_engine

sources:
- kind: tar
  url: https://download.sourceforge.net/lcms/lcms2-2.9.tar.gz
  ref: 48c6fdf98396fa245ed86e622028caf49b96fa22f3e5734f853f806fbc8e7d20
