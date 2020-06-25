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

  local_flags: -fcommon

(@):
- elements/include/gnupg-source.yml
