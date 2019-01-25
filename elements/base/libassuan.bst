kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/libgpg-error.bst
- filename: base/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libassuan.so'

sources:
- kind: git_tag
  url: gnupg:libassuan.git
  track: master
  ref: libassuan-2.5.2-0-g86e1d17de081081f9302ca58cc2e07ecde3172f6
