kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/libgpg-error.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/texinfo.bst
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
        - '%{bindir}/libgcrypt-config'
        - '%{libdir}/libgcrypt.so'

sources:
- kind: git_tag
  url: gnupg:libgcrypt.git
  track: LIBGCRYPT-1.8-BRANCH
  ref: libgcrypt-1.8.9-0-gfdb05b27966fd488fbe367f4313e4fa3630367fc
