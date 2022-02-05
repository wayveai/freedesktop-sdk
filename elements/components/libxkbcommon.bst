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
        - '%{libdir}/libxkbregistry.so'

sources:
- kind: git_tag
  url: github:xkbcommon/libxkbcommon.git
  track: master
  ref: xkbcommon-1.4.0-0-gea6580cc3913d93655ecf92a5913de652315efc3
