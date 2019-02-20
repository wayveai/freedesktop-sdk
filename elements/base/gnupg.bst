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
  track: master
  ref: gnupg-2.2.13-0-g7922e2dd1c7eee48a8a2cf4799827942489ddd0f
- kind: patch
  path: patches/gnupg/gnupg-don-t-include-tests-with-tarred-data.patch
