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
  ref: 5.2.0-0-ge158df5353b57ac7002d5cac4b3a040eba4c0c9f
