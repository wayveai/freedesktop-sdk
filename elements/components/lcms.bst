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
    patches:
    - CVE-2018-16435

sources:
- kind: git_tag
  url: github:mm2/Little-CMS.git
  track: master
  match:
  - lcms2.*
  exclude:
  - lcms2.*rc*
  ref: lcms2.9-0-g29b019fd8726da70f162c7ce193440fe1ec4236f
- kind: patch
  path: patches/lcms/CVE-2018-16435.patch
