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
        - '%{libdir}/libtiff.so'
        - '%{libdir}/libtiffxx.so'

sources:
- kind: git_tag
  url: https://gitlab.com/libtiff/libtiff.git
  track: master
  ref: v4.0.10-0-gb8eac98dd0849c3f888518ce5cecc020f8b2991c
