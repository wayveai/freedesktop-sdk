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
  ref: gnupg-2.2.19-0-g1c841c8389fb9640762822395b988e0d1584c9ae
- kind: patch
  path: patches/gnupg/gnupg-don-t-include-tests-with-tarred-data.patch
