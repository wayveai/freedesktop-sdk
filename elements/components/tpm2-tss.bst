kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/doxygen.bst
- components/git-minimal.bst
- components/systemd-stage1.bst

depends:
- components/libgcrypt.bst
- components/json-c.bst
- components/curl.bst
- components/openssl.bst

sources:
- kind: git_tag
  url: github:tpm2-software/tpm2-tss.git
  track: master
  track-extra:
  - 3.2.x
  exclude:
  - '*rc*'
  ref: 3.2.0-0-ge237e4d33cbf280292a480edd8ad061dcd3a37a2
- kind: patch
  path: patches/tpm2-tss/conditionally-check-for-user-group-manipulation-commands.patch
- kind: patch
  path: patches/tpm2-tss/prevent-dirty-version.patch
