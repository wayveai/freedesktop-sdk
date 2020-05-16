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

  local_flags: -Wno-unused-result -fcommon

sources:
- kind: git_tag
  url: gnupg:gnupg.git
  track: STABLE-BRANCH-2-2
  ref: gnupg-2.2.20-0-g5094bb08edd48087a5aa89494fc361f0ce4f34aa
- kind: patch
  path: patches/gnupg/gnupg-don-t-include-tests-with-tarred-data.patch
