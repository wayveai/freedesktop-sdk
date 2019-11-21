kind: meson

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/buildsystem-meson.bst
    type: build
  - filename: base/jpeg.bst
  - filename: base/libpng.bst
  - filename: desktop/gtk3.bst
  - filename: desktop/systemd.bst
  - filename: vm/linux-vm-boot/mtdev.bst
  - filename: vm/linux-vm-boot/libevdev.bst
  - filename: vm/linux-vm-boot/libwacom.bst

# documentation depends on doxygen
variables:
  meson-local: |
    -Ddocumentation=false \
    -Dtests=false

sources:
  - kind: git_tag
    url: freedesktop:libinput/libinput.git
    track: master
    ref: 1.12.6-0-g9da9118edc3092e32e247a227394c257b2c30404
