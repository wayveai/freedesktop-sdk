kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/libogg.bst
- filename: public-stacks/buildsystem-autotools.bst
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
        - '%{libdir}/libFLAC.so'
        - '%{libdir}/libFLAC++.so'

sources:
- kind: git_tag
  url: xiph:flac.git
  track: master
  track-extra:
  - '1.3.x'
  ref: 1.3.4-0-g1151c93e992bb8c7c6394e04aa880d711c531c7f
  match:
  - '*.*.*'
