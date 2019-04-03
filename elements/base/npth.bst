kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/gettext.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libnpth.so'

sources:
- kind: git_tag
  url: gnupg:npth.git
  track: master
  ref: npth-1.6-0-g771287929ed226add3ef27de882c5359dcd3f66e
