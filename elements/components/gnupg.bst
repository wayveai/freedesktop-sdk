kind: autotools

depends:
- bootstrap-import.bst
- components/libgcrypt.bst
- components/libassuan.bst
- components/libksba.bst
- components/npth.bst
- components/sqlite.bst

build-depends:
- public-stacks/buildsystem-autotools.bst

variables:
  conf-local: |
    --enable-maintainer-mode \
    --disable-doc \
    --disable-all-tests

sources:
- kind: git_tag
  url: gnupg:gnupg.git
  track: STABLE-BRANCH-2-2
  ref: gnupg-2.2.17-0-g591523ec94b6279b8b39a01501d78cf980de8722
- kind: patch
  path: patches/gnupg/gnupg-don-t-include-tests-with-tarred-data.patch
