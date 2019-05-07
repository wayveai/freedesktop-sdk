kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/libgcrypt.bst
- filename: components/libassuan.bst
- filename: components/libksba.bst
- filename: components/npth.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

variables:
  conf-local: |
    --enable-maintainer-mode \
    --disable-doc \
    --disable-all-tests

sources:
- kind: git_tag
  url: gnupg:gnupg.git
  track: STABLE-BRANCH-2-2
  ref: gnupg-2.2.15-0-gdc93e57226db32d5b90884dcf768d271baa6628a
- kind: patch
  path: patches/gnupg/gnupg-don-t-include-tests-with-tarred-data.patch
