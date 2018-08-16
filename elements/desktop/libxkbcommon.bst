kind: meson

depends:
- filename: bootstrap-import.bst
- filename: desktop/wayland-protocols.bst
- filename: desktop/xorg-data-xkeyboard-config.bst
- filename: base/buildsystem-meson.bst
  type: build
- filename: base/bison.bst
  type: build

variables:
  meson-local: |
    -Denable-docs=false \
    -Denable-x11=true

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libxkbcommon.so'
        - '%{libdir}/libxkbcommon-x11.so'
  cpe:
    version: '0.8.2'

sources:
- kind: git_tag
  url: github:xkbcommon/libxkbcommon.git
  track: master
  ref: xkbcommon-0.8.2-0-gf8134c8503c9868d65ee6e06b211ec2eaff3f60d
