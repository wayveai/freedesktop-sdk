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
  ref: libgcrypt-1.8.6-0-gcfdc44bf08a32d37b144302bf1f7c4798b36762e
