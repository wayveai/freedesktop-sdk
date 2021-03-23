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

sources:
- kind: git_tag
  url: github:storaged-project/libblockdev.git
  track: master
  track-extra:
  - 2.x-branch
  ref: 2.25-1-0-gc50869272b54bf4b4bc3825e8c3332a54678b43f
