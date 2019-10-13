kind: meson

depends:
- filename: bootstrap-import.bst
- filename: components/wayland.bst
- filename: components/wayland-protocols.bst
  type: build
- filename: components/xorg-data-xkeyboard-config.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/bison.bst
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

sources:
- kind: git_tag
  url: github:xkbcommon/libxkbcommon.git
  track: master
  ref: xkbcommon-0.8.4-0-gd40b368b2f4c4cd130f63ac41e4a9d53b684c712
