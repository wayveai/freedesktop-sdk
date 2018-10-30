kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
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
  url: https://github.com/dbry/WavPack.git
  track: master
  ref: 9ccc3fe4a37d069137ceabe513a4dd9b0a09c1c2 # v 5.1.0
