kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/bc.bst
  type: build

variables:
  autogen: ./bootstrap

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{bindir}/brotli"
        - "%{libdir}/libbrotlicommon.so"
        - "%{libdir}/libbrotlidec.so"
        - "%{libdir}/libbrotlienc.so"

sources:
- kind: git_tag
  url: github:google/brotli.git
  track: master
  track-extra:
  - v1.0
  match:
  - v*
  ref: v1.0.7-0-gd6d98957ca8ccb1ef45922e978bb10efca0ea541
