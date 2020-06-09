kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/libtiff.bst
- filename: components/jpeg.bst

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
- kind: git_tag
  url: github:mm2/Little-CMS.git
  track: master
  match:
  - lcms2.*
  exclude:
  - lcms2.*rc*
  ref: lcms2.10-0-g2021357a297ea145bf43f256d1aed718a32215f4
