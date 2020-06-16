kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/cryptsetup.bst
- components/kmod.bst
- components/libbytesize.bst
- components/libyaml.bst
- components/lvm2.bst
- components/mdadm.bst
- components/ndctl.bst
- components/parted.bst
- components/systemd.bst
- components/volume-key.bst

variables:
  conf-local: >-
    --without-dmraid
    --with-mdraid

sources:
- kind: git_tag
  url: github:storaged-project/libblockdev.git
  track: master
  ref: 2.23-1-0-gf5d2458e9e52d8c55b609ae8cf46ef0673b4a02a
