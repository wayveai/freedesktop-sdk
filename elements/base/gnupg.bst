kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/libgcrypt.bst
- filename: base/libassuan.bst
- filename: base/libksba.bst
- filename: base/npth.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/gettext.bst
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
  ref: gnupg-2.2.16-0-g3f2b7a53ddc43b3a349451d28691aaaa116786dc
- kind: patch
  path: patches/gnupg/gnupg-don-t-include-tests-with-tarred-data.patch
