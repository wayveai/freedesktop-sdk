kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/libgpg-error.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/texinfo.bst
  type: build

variables:
  conf-local: |
    --enable-maintainer-mode \
    --disable-doc

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgcrypt.so'

sources:
- kind: git_tag
  url: gnupg:libgcrypt.git
  track: master
  ref: libgcrypt-1.8.4-0-g93775172713c00c363187b5d6a88895b04ac7c8e
