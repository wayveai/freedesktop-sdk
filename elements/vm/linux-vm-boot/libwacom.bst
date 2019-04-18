kind: autotools

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: public-stacks/buildsystem-autotools.bst
    type: build
  - filename: components/glib.bst
  - filename: components/systemd.bst
  - filename: vm/linux-vm-boot/libgudev.bst

sources:
  - kind: git_tag
    url: github:linuxwacom/libwacom.git
    ref: libwacom-0.32-0-g131dab3d3cbe0fe2309be1a0815cf331049e8b6c
