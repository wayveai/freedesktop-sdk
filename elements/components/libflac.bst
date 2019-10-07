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
  url: https://git.xiph.org/flac.git
  track: master
  ref: 1.3.3-0-gf764434a39e8a8715d5871bb263189e5a7298280
