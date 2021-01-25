kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build


variables:
  autogen: autoreconf -vif

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libwavpack.so'

sources:
- kind: git_tag
  url: github:dbry/WavPack.git
  track: master
  ref: 5.4.0-0-g2ce3c069be548e82ea9c05741ace6583e549c6de
