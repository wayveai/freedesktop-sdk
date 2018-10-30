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
  url: https://github.com/xiph/ogg
  track: master
  ref: 4380566a44b8d5e85ad511c9c17eb04197863ec5   # 1.3.3
