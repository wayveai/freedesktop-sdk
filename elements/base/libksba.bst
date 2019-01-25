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
        - '%{libdir}/libksba.so'

sources:
- kind: git_tag
  url: gnupg:libksba.git
  track: master
  ref: libksba-1.3.5-0-g25cc42cf61a56e01f1bd72883e452f691dda8309
