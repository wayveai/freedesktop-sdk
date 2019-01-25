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
        - '%{libdir}/libgpg-error.so'

sources:
- kind: git_tag
  url: gnupg:libgpg-error.git
  track: master
  ref: libgpg-error-1.34-0-g8bc75741cadf95e2fac64891cf402cde891afe64
