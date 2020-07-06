kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/json-c.bst
- components/systemd.bst
- components/kmod.bst

variables:
  conf-local: >-
    --without-keyutils
    --without-bash
    --disable-docs

  local_flags: -fcommon

sources:
- kind: git_tag
  url: github:pmem/ndctl.git
  track: master
  ref: v68-0-gc7767834871f7ce50a2abe1da946e9e16fb08eda
