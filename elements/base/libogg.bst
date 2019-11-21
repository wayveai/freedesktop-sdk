kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libogg.so'

sources:
- kind: git_tag
  url: github:xiph/ogg.git
  track: master
  ref: v1.3.3-0-g4380566a44b8d5e85ad511c9c17eb04197863ec5
