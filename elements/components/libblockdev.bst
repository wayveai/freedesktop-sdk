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
- components/parted.bst
- components/systemd.bst
- components/volume-key.bst

variables:
  conf-local: >-
    --without-dmraid
    --without-nvdimm
    --with-mdraid
  local_flags: >-
    -Wno-error

sources:
- kind: git_tag
  url: github:storaged-project/libblockdev.git
  track: master
  track-extra:
  - 2.x-branch
  ref: 2.26-1-0-g47ff12242c89e36a33259d18b7068b26c3bb1c64
