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
  ref: lcms2.13.1-0-g233004ae26b238b2831ff60eea9e753b99d97906
